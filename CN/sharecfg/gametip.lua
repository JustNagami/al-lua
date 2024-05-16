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
	ship_remould_warning_105234 = {
		210786,
		226,
		true
	},
	ship_remould_warning_107984 = {
		211012,
		213,
		true
	},
	ship_remould_warning_201514 = {
		211225,
		232,
		true
	},
	ship_remould_warning_203114 = {
		211457,
		337,
		true
	},
	ship_remould_warning_203124 = {
		211794,
		337,
		true
	},
	ship_remould_warning_205124 = {
		212131,
		185,
		true
	},
	ship_remould_warning_205154 = {
		212316,
		220,
		true
	},
	ship_remould_warning_206134 = {
		212536,
		298,
		true
	},
	ship_remould_warning_301534 = {
		212834,
		220,
		true
	},
	ship_remould_warning_301874 = {
		213054,
		534,
		true
	},
	ship_remould_warning_310014 = {
		213588,
		431,
		true
	},
	ship_remould_warning_310024 = {
		214019,
		431,
		true
	},
	ship_remould_warning_310034 = {
		214450,
		431,
		true
	},
	ship_remould_warning_310044 = {
		214881,
		431,
		true
	},
	ship_remould_warning_303154 = {
		215312,
		564,
		true
	},
	ship_remould_warning_402134 = {
		215876,
		228,
		true
	},
	ship_remould_warning_702124 = {
		216104,
		468,
		true
	},
	ship_remould_warning_520014 = {
		216572,
		246,
		true
	},
	ship_remould_warning_521014 = {
		216818,
		246,
		true
	},
	ship_remould_warning_520034 = {
		217064,
		246,
		true
	},
	ship_remould_warning_521034 = {
		217310,
		246,
		true
	},
	ship_remould_warning_520044 = {
		217556,
		246,
		true
	},
	ship_remould_warning_521044 = {
		217802,
		246,
		true
	},
	ship_remould_warning_502114 = {
		218048,
		222,
		true
	},
	ship_remould_warning_506114 = {
		218270,
		388,
		true
	},
	word_soundfiles_download_title = {
		218658,
		109,
		true
	},
	word_soundfiles_download = {
		218767,
		100,
		true
	},
	word_soundfiles_checking_title = {
		218867,
		106,
		true
	},
	word_soundfiles_checking = {
		218973,
		97,
		true
	},
	word_soundfiles_checkend_title = {
		219070,
		115,
		true
	},
	word_soundfiles_checkend = {
		219185,
		100,
		true
	},
	word_soundfiles_noneedupdate = {
		219285,
		104,
		true
	},
	word_soundfiles_checkfailed = {
		219389,
		112,
		true
	},
	word_soundfiles_retry = {
		219501,
		97,
		true
	},
	word_soundfiles_update = {
		219598,
		98,
		true
	},
	word_soundfiles_update_end_title = {
		219696,
		117,
		true
	},
	word_soundfiles_update_end = {
		219813,
		102,
		true
	},
	word_soundfiles_update_failed = {
		219915,
		114,
		true
	},
	word_soundfiles_update_retry = {
		220029,
		104,
		true
	},
	word_live2dfiles_download_title = {
		220133,
		116,
		true
	},
	word_live2dfiles_download = {
		220249,
		101,
		true
	},
	word_live2dfiles_checking_title = {
		220350,
		107,
		true
	},
	word_live2dfiles_checking = {
		220457,
		98,
		true
	},
	word_live2dfiles_checkend_title = {
		220555,
		122,
		true
	},
	word_live2dfiles_checkend = {
		220677,
		101,
		true
	},
	word_live2dfiles_noneedupdate = {
		220778,
		105,
		true
	},
	word_live2dfiles_checkfailed = {
		220883,
		119,
		true
	},
	word_live2dfiles_retry = {
		221002,
		98,
		true
	},
	word_live2dfiles_update = {
		221100,
		99,
		true
	},
	word_live2dfiles_update_end_title = {
		221199,
		124,
		true
	},
	word_live2dfiles_update_end = {
		221323,
		103,
		true
	},
	word_live2dfiles_update_failed = {
		221426,
		121,
		true
	},
	word_live2dfiles_update_retry = {
		221547,
		105,
		true
	},
	word_live2dfiles_main_update_tip = {
		221652,
		164,
		true
	},
	achieve_propose_tip = {
		221816,
		106,
		true
	},
	mingshi_get_tip = {
		221922,
		124,
		true
	},
	mingshi_task_tip_1 = {
		222046,
		212,
		true
	},
	mingshi_task_tip_2 = {
		222258,
		212,
		true
	},
	mingshi_task_tip_3 = {
		222470,
		205,
		true
	},
	mingshi_task_tip_4 = {
		222675,
		212,
		true
	},
	mingshi_task_tip_5 = {
		222887,
		205,
		true
	},
	mingshi_task_tip_6 = {
		223092,
		205,
		true
	},
	mingshi_task_tip_7 = {
		223297,
		212,
		true
	},
	mingshi_task_tip_8 = {
		223509,
		209,
		true
	},
	mingshi_task_tip_9 = {
		223718,
		205,
		true
	},
	mingshi_task_tip_10 = {
		223923,
		213,
		true
	},
	mingshi_task_tip_11 = {
		224136,
		209,
		true
	},
	word_propose_changename_title = {
		224345,
		168,
		true
	},
	word_propose_changename_tip1 = {
		224513,
		140,
		true
	},
	word_propose_changename_tip2 = {
		224653,
		116,
		true
	},
	word_propose_ring_tip = {
		224769,
		118,
		true
	},
	word_rename_time_tip = {
		224887,
		135,
		true
	},
	word_rename_switch_tip = {
		225022,
		148,
		true
	},
	word_ssr = {
		225170,
		81,
		true
	},
	word_sr = {
		225251,
		77,
		true
	},
	word_r = {
		225328,
		76,
		true
	},
	ship_renameShip_error = {
		225404,
		106,
		true
	},
	ship_renameShip_error_4 = {
		225510,
		99,
		true
	},
	ship_renameShip_error_2011 = {
		225609,
		102,
		true
	},
	ship_proposeShip_error = {
		225711,
		98,
		true
	},
	ship_proposeShip_error_1 = {
		225809,
		100,
		true
	},
	word_rename_time_warning = {
		225909,
		210,
		true
	},
	word_propose_cost_tip = {
		226119,
		354,
		true
	},
	word_propose_switch_tip = {
		226473,
		99,
		true
	},
	evaluate_too_loog = {
		226572,
		93,
		true
	},
	evaluate_ban_word = {
		226665,
		99,
		true
	},
	activity_level_easy_tip = {
		226764,
		192,
		true
	},
	activity_level_difficulty_tip = {
		226956,
		207,
		true
	},
	activity_level_limit_tip = {
		227163,
		189,
		true
	},
	activity_level_inwarime_tip = {
		227352,
		177,
		true
	},
	activity_level_pass_easy_tip = {
		227529,
		163,
		true
	},
	activity_level_is_closed = {
		227692,
		112,
		true
	},
	activity_switch_tip = {
		227804,
		255,
		true
	},
	reduce_sp3_pass_count = {
		228059,
		109,
		true
	},
	qiuqiu_count = {
		228168,
		87,
		true
	},
	qiuqiu_total_count = {
		228255,
		93,
		true
	},
	npcfriendly_count = {
		228348,
		99,
		true
	},
	npcfriendly_total_count = {
		228447,
		105,
		true
	},
	longxiang_count = {
		228552,
		96,
		true
	},
	longxiang_total_count = {
		228648,
		102,
		true
	},
	pt_count = {
		228750,
		77,
		true
	},
	pt_total_count = {
		228827,
		89,
		true
	},
	remould_ship_ok = {
		228916,
		91,
		true
	},
	remould_ship_count_more = {
		229007,
		115,
		true
	},
	word_should_input = {
		229122,
		102,
		true
	},
	simulation_advantage_counting = {
		229224,
		128,
		true
	},
	simulation_disadvantage_counting = {
		229352,
		132,
		true
	},
	simulation_enhancing = {
		229484,
		148,
		true
	},
	simulation_enhanced = {
		229632,
		110,
		true
	},
	word_skill_desc_get = {
		229742,
		97,
		true
	},
	word_skill_desc_learn = {
		229839,
		89,
		true
	},
	chapter_tip_aovid_succeed = {
		229928,
		101,
		true
	},
	chapter_tip_aovid_failed = {
		230029,
		100,
		true
	},
	chapter_tip_change = {
		230129,
		99,
		true
	},
	chapter_tip_use = {
		230228,
		96,
		true
	},
	chapter_tip_with_npc = {
		230324,
		262,
		true
	},
	chapter_tip_bp_ammo = {
		230586,
		131,
		true
	},
	build_ship_tip = {
		230717,
		212,
		true
	},
	auto_battle_limit_tip = {
		230929,
		115,
		true
	},
	build_ship_quickly_buy_stone = {
		231044,
		199,
		true
	},
	build_ship_quickly_buy_tool = {
		231243,
		214,
		true
	},
	ship_profile_voice_locked = {
		231457,
		110,
		true
	},
	ship_profile_skin_locked = {
		231567,
		103,
		true
	},
	ship_profile_words = {
		231670,
		94,
		true
	},
	ship_profile_action_words = {
		231764,
		107,
		true
	},
	ship_profile_label_common = {
		231871,
		95,
		true
	},
	ship_profile_label_diff = {
		231966,
		93,
		true
	},
	level_fleet_lease_one_ship = {
		232059,
		126,
		true
	},
	level_fleet_not_enough = {
		232185,
		122,
		true
	},
	level_fleet_outof_limit = {
		232307,
		117,
		true
	},
	vote_success = {
		232424,
		88,
		true
	},
	vote_not_enough = {
		232512,
		100,
		true
	},
	vote_love_not_enough = {
		232612,
		108,
		true
	},
	vote_love_limit = {
		232720,
		134,
		true
	},
	vote_love_confirm = {
		232854,
		142,
		true
	},
	vote_primary_rule = {
		232996,
		1126,
		true
	},
	vote_final_title1 = {
		234122,
		93,
		true
	},
	vote_final_rule1 = {
		234215,
		427,
		true
	},
	vote_final_title2 = {
		234642,
		93,
		true
	},
	vote_final_rule2 = {
		234735,
		290,
		true
	},
	vote_vote_time = {
		235025,
		98,
		true
	},
	vote_vote_count = {
		235123,
		84,
		true
	},
	vote_vote_group = {
		235207,
		84,
		true
	},
	vote_rank_refresh_time = {
		235291,
		117,
		true
	},
	vote_rank_in_current_server = {
		235408,
		122,
		true
	},
	words_auto_battle_label = {
		235530,
		120,
		true
	},
	words_show_ship_name_label = {
		235650,
		117,
		true
	},
	words_rare_ship_vibrate = {
		235767,
		105,
		true
	},
	words_display_ship_get_effect = {
		235872,
		117,
		true
	},
	words_show_touch_effect = {
		235989,
		105,
		true
	},
	words_bg_fit_mode = {
		236094,
		111,
		true
	},
	words_battle_hide_bg = {
		236205,
		114,
		true
	},
	words_battle_expose_line = {
		236319,
		118,
		true
	},
	words_autoFight_battery_savemode = {
		236437,
		120,
		true
	},
	words_autoFight_battery_savemode_des = {
		236557,
		181,
		true
	},
	words_autoFIght_down_frame = {
		236738,
		108,
		true
	},
	words_autoFIght_down_frame_des = {
		236846,
		173,
		true
	},
	words_autoFight_tips = {
		237019,
		120,
		true
	},
	words_autoFight_right = {
		237139,
		158,
		true
	},
	activity_puzzle_get1 = {
		237297,
		136,
		true
	},
	activity_puzzle_get2 = {
		237433,
		138,
		true
	},
	activity_puzzle_get3 = {
		237571,
		138,
		true
	},
	activity_puzzle_get4 = {
		237709,
		138,
		true
	},
	activity_puzzle_get5 = {
		237847,
		138,
		true
	},
	activity_puzzle_get6 = {
		237985,
		138,
		true
	},
	activity_puzzle_get7 = {
		238123,
		138,
		true
	},
	activity_puzzle_get8 = {
		238261,
		138,
		true
	},
	activity_puzzle_get9 = {
		238399,
		138,
		true
	},
	activity_puzzle_get10 = {
		238537,
		137,
		true
	},
	activity_puzzle_get11 = {
		238674,
		137,
		true
	},
	activity_puzzle_get12 = {
		238811,
		137,
		true
	},
	activity_puzzle_get13 = {
		238948,
		137,
		true
	},
	activity_puzzle_get14 = {
		239085,
		137,
		true
	},
	activity_puzzle_get15 = {
		239222,
		137,
		true
	},
	exchange_item_success = {
		239359,
		97,
		true
	},
	give_up_cloth_change = {
		239456,
		117,
		true
	},
	err_cloth_change_noship = {
		239573,
		98,
		true
	},
	new_skin_no_choose = {
		239671,
		140,
		true
	},
	sure_resume_volume = {
		239811,
		124,
		true
	},
	course_class_not_ready = {
		239935,
		119,
		true
	},
	course_student_max_level = {
		240054,
		134,
		true
	},
	course_stop_confirm = {
		240188,
		125,
		true
	},
	course_class_help = {
		240313,
		1321,
		true
	},
	course_class_name = {
		241634,
		104,
		true
	},
	course_proficiency_not_enough = {
		241738,
		108,
		true
	},
	course_state_rest = {
		241846,
		93,
		true
	},
	course_state_lession = {
		241939,
		99,
		true
	},
	course_energy_not_enough = {
		242038,
		144,
		true
	},
	course_proficiency_tip = {
		242182,
		318,
		true
	},
	course_sunday_tip = {
		242500,
		136,
		true
	},
	course_exit_confirm = {
		242636,
		138,
		true
	},
	course_learning = {
		242774,
		94,
		true
	},
	time_remaining_tip = {
		242868,
		95,
		true
	},
	propose_intimacy_tip = {
		242963,
		112,
		true
	},
	no_found_record_equipment = {
		243075,
		180,
		true
	},
	sec_floor_limit_tip = {
		243255,
		125,
		true
	},
	guild_shop_flash_success = {
		243380,
		100,
		true
	},
	destroy_high_rarity_tip = {
		243480,
		122,
		true
	},
	destroy_high_level_tip = {
		243602,
		124,
		true
	},
	destroy_eliteequipment_tip = {
		243726,
		119,
		true
	},
	destroy_high_intensify_tip = {
		243845,
		127,
		true
	},
	destroy_inHardFormation_tip = {
		243972,
		130,
		true
	},
	destroy_equip_rarity_tip = {
		244102,
		135,
		true
	},
	ship_quick_change_noequip = {
		244237,
		113,
		true
	},
	ship_quick_change_nofreeequip = {
		244350,
		120,
		true
	},
	word_nowenergy = {
		244470,
		93,
		true
	},
	word_energy_recov_speed = {
		244563,
		99,
		true
	},
	destroy_eliteship_tip = {
		244662,
		117,
		true
	},
	err_resloveequip_nochoice = {
		244779,
		113,
		true
	},
	take_nothing = {
		244892,
		94,
		true
	},
	take_all_mail = {
		244986,
		164,
		true
	},
	buy_furniture_overtime = {
		245150,
		119,
		true
	},
	data_erro = {
		245269,
		88,
		true
	},
	login_failed = {
		245357,
		88,
		true
	},
	["not yet completed"] = {
		245445,
		93,
		true
	},
	escort_less_count_to_combat = {
		245538,
		131,
		true
	},
	ten_even_draw = {
		245669,
		88,
		true
	},
	ten_even_draw_confirm = {
		245757,
		111,
		true
	},
	level_risk_level_desc = {
		245868,
		90,
		true
	},
	level_risk_level_mitigation_rate = {
		245958,
		229,
		true
	},
	level_diffcult_chapter_state_safety = {
		246187,
		221,
		true
	},
	level_chapter_state_high_risk = {
		246408,
		135,
		true
	},
	level_chapter_state_risk = {
		246543,
		130,
		true
	},
	level_chapter_state_low_risk = {
		246673,
		134,
		true
	},
	level_chapter_state_safety = {
		246807,
		132,
		true
	},
	open_skill_class_success = {
		246939,
		112,
		true
	},
	backyard_sort_tag_default = {
		247051,
		95,
		true
	},
	backyard_sort_tag_price = {
		247146,
		93,
		true
	},
	backyard_sort_tag_comfortable = {
		247239,
		102,
		true
	},
	backyard_sort_tag_size = {
		247341,
		92,
		true
	},
	backyard_filter_tag_other = {
		247433,
		95,
		true
	},
	word_status_inFight = {
		247528,
		92,
		true
	},
	word_status_inPVP = {
		247620,
		90,
		true
	},
	word_status_inEvent = {
		247710,
		92,
		true
	},
	word_status_inEventFinished = {
		247802,
		100,
		true
	},
	word_status_inTactics = {
		247902,
		94,
		true
	},
	word_status_inClass = {
		247996,
		92,
		true
	},
	word_status_rest = {
		248088,
		89,
		true
	},
	word_status_train = {
		248177,
		90,
		true
	},
	word_status_world = {
		248267,
		96,
		true
	},
	word_status_inHardFormation = {
		248363,
		106,
		true
	},
	word_status_series_enemy = {
		248469,
		103,
		true
	},
	challenge_rule = {
		248572,
		741,
		true
	},
	challenge_exit_warning = {
		249313,
		199,
		true
	},
	challenge_fleet_type_fail = {
		249512,
		132,
		true
	},
	challenge_current_level = {
		249644,
		110,
		true
	},
	challenge_current_score = {
		249754,
		104,
		true
	},
	challenge_total_score = {
		249858,
		102,
		true
	},
	challenge_current_progress = {
		249960,
		110,
		true
	},
	challenge_count_unlimit = {
		250070,
		112,
		true
	},
	challenge_no_fleet = {
		250182,
		115,
		true
	},
	equipment_skin_unload = {
		250297,
		118,
		true
	},
	equipment_skin_no_old_ship = {
		250415,
		105,
		true
	},
	equipment_skin_no_old_skinorequipment = {
		250520,
		132,
		true
	},
	equipment_skin_no_new_ship = {
		250652,
		105,
		true
	},
	equipment_skin_no_new_equipment = {
		250757,
		113,
		true
	},
	equipment_skin_count_noenough = {
		250870,
		111,
		true
	},
	equipment_skin_replace_done = {
		250981,
		109,
		true
	},
	equipment_skin_unload_failed = {
		251090,
		116,
		true
	},
	equipment_skin_unmatch_equipment = {
		251206,
		158,
		true
	},
	equipment_skin_no_equipment_tip = {
		251364,
		141,
		true
	},
	activity_pool_awards_empty = {
		251505,
		117,
		true
	},
	activity_switch_award_pool_failed = {
		251622,
		161,
		true
	},
	help_activitypool_1 = {
		251783,
		480,
		true
	},
	help_activitypool_2 = {
		252263,
		443,
		true
	},
	help_activitypool_3 = {
		252706,
		477,
		true
	},
	shop_street_activity_tip = {
		253183,
		195,
		true
	},
	shop_street_Equipment_skin_box_help = {
		253378,
		173,
		true
	},
	commander_material_noenough = {
		253551,
		103,
		true
	},
	battle_result_boss_destruct = {
		253654,
		120,
		true
	},
	battle_preCombatLayer_boss_destruct = {
		253774,
		128,
		true
	},
	destory_important_equipment_tip = {
		253902,
		204,
		true
	},
	destory_important_equipment_input_erro = {
		254106,
		120,
		true
	},
	activity_hit_monster_nocount = {
		254226,
		104,
		true
	},
	activity_hit_monster_death = {
		254330,
		111,
		true
	},
	activity_hit_monster_help = {
		254441,
		104,
		true
	},
	activity_hit_monster_erro = {
		254545,
		101,
		true
	},
	activity_xiaotiane_progress = {
		254646,
		104,
		true
	},
	activity_hit_monster_reset_tip = {
		254750,
		165,
		true
	},
	answer_help_tip = {
		254915,
		182,
		true
	},
	answer_answer_role = {
		255097,
		172,
		true
	},
	answer_exit_tip = {
		255269,
		112,
		true
	},
	equip_skin_detail_tip = {
		255381,
		115,
		true
	},
	emoji_type_0 = {
		255496,
		82,
		true
	},
	emoji_type_1 = {
		255578,
		82,
		true
	},
	emoji_type_2 = {
		255660,
		82,
		true
	},
	emoji_type_3 = {
		255742,
		82,
		true
	},
	emoji_type_4 = {
		255824,
		85,
		true
	},
	card_pairs_help_tip = {
		255909,
		840,
		true
	},
	card_pairs_tips = {
		256749,
		167,
		true
	},
	["card_battle_card details_deck"] = {
		256916,
		109,
		true
	},
	["card_battle_card details_hand"] = {
		257025,
		111,
		true
	},
	["card_battle_card details"] = {
		257136,
		111,
		true
	},
	["card_battle_card details_switchto_deck"] = {
		257247,
		124,
		true
	},
	["card_battle_card details_switchto_hand"] = {
		257371,
		121,
		true
	},
	card_battle_card_empty_en = {
		257492,
		106,
		true
	},
	card_battle_card_empty_ch = {
		257598,
		122,
		true
	},
	card_puzzel_goal_ch = {
		257720,
		95,
		true
	},
	card_puzzel_goal_en = {
		257815,
		89,
		true
	},
	card_puzzle_deck = {
		257904,
		89,
		true
	},
	upgrade_to_next_maxlevel_failed = {
		257993,
		151,
		true
	},
	upgrade_to_next_maxlevel_tip = {
		258144,
		157,
		true
	},
	upgrade_to_next_maxlevel_succeed = {
		258301,
		164,
		true
	},
	extra_chapter_socre_tip = {
		258465,
		186,
		true
	},
	extra_chapter_record_updated = {
		258651,
		104,
		true
	},
	extra_chapter_record_not_updated = {
		258755,
		111,
		true
	},
	extra_chapter_locked_tip = {
		258866,
		133,
		true
	},
	extra_chapter_locked_tip_1 = {
		258999,
		135,
		true
	},
	player_name_change_time_lv_tip = {
		259134,
		162,
		true
	},
	player_name_change_time_limit_tip = {
		259296,
		147,
		true
	},
	player_name_change_windows_tip = {
		259443,
		200,
		true
	},
	player_name_change_warning = {
		259643,
		292,
		true
	},
	player_name_change_success = {
		259935,
		117,
		true
	},
	player_name_change_failed = {
		260052,
		116,
		true
	},
	same_player_name_tip = {
		260168,
		120,
		true
	},
	task_is_not_existence = {
		260288,
		105,
		true
	},
	cannot_build_multiple_printblue = {
		260393,
		274,
		true
	},
	printblue_build_success = {
		260667,
		99,
		true
	},
	printblue_build_erro = {
		260766,
		96,
		true
	},
	blueprint_mod_success = {
		260862,
		97,
		true
	},
	blueprint_mod_erro = {
		260959,
		94,
		true
	},
	technology_refresh_sucess = {
		261053,
		113,
		true
	},
	technology_refresh_erro = {
		261166,
		111,
		true
	},
	change_technology_refresh_sucess = {
		261277,
		120,
		true
	},
	change_technology_refresh_erro = {
		261397,
		118,
		true
	},
	technology_start_up = {
		261515,
		95,
		true
	},
	technology_start_erro = {
		261610,
		97,
		true
	},
	technology_stop_success = {
		261707,
		105,
		true
	},
	technology_stop_erro = {
		261812,
		102,
		true
	},
	technology_finish_success = {
		261914,
		107,
		true
	},
	technology_finish_erro = {
		262021,
		104,
		true
	},
	blueprint_stop_success = {
		262125,
		104,
		true
	},
	blueprint_stop_erro = {
		262229,
		101,
		true
	},
	blueprint_destory_tip = {
		262330,
		109,
		true
	},
	blueprint_task_update_tip = {
		262439,
		175,
		true
	},
	blueprint_mod_addition_lock = {
		262614,
		105,
		true
	},
	blueprint_mod_word_unlock = {
		262719,
		104,
		true
	},
	blueprint_mod_skin_unlock = {
		262823,
		104,
		true
	},
	blueprint_build_consume = {
		262927,
		126,
		true
	},
	blueprint_stop_tip = {
		263053,
		124,
		true
	},
	technology_canot_refresh = {
		263177,
		134,
		true
	},
	technology_refresh_tip = {
		263311,
		114,
		true
	},
	technology_is_actived = {
		263425,
		115,
		true
	},
	technology_stop_tip = {
		263540,
		125,
		true
	},
	technology_help_text = {
		263665,
		2683,
		true
	},
	blueprint_build_time_tip = {
		266348,
		171,
		true
	},
	blueprint_cannot_build_tip = {
		266519,
		143,
		true
	},
	technology_task_none_tip = {
		266662,
		93,
		true
	},
	technology_task_build_tip = {
		266755,
		126,
		true
	},
	blueprint_commit_tip = {
		266881,
		146,
		true
	},
	buleprint_need_level_tip = {
		267027,
		108,
		true
	},
	blueprint_max_level_tip = {
		267135,
		105,
		true
	},
	ship_profile_voice_locked_intimacy = {
		267240,
		124,
		true
	},
	ship_profile_voice_locked_propose = {
		267364,
		112,
		true
	},
	ship_profile_voice_locked_propose_imas = {
		267476,
		117,
		true
	},
	ship_profile_voice_locked_design = {
		267593,
		128,
		true
	},
	ship_profile_voice_locked_meta = {
		267721,
		136,
		true
	},
	help_technolog0 = {
		267857,
		350,
		true
	},
	help_technolog = {
		268207,
		513,
		true
	},
	hide_chat_warning = {
		268720,
		157,
		true
	},
	show_chat_warning = {
		268877,
		154,
		true
	},
	help_shipblueprintui = {
		269031,
		2123,
		true
	},
	help_shipblueprintui_luck = {
		271154,
		704,
		true
	},
	anniversary_task_title_1 = {
		271858,
		176,
		true
	},
	anniversary_task_title_2 = {
		272034,
		167,
		true
	},
	anniversary_task_title_3 = {
		272201,
		176,
		true
	},
	anniversary_task_title_4 = {
		272377,
		164,
		true
	},
	anniversary_task_title_5 = {
		272541,
		173,
		true
	},
	anniversary_task_title_6 = {
		272714,
		173,
		true
	},
	anniversary_task_title_7 = {
		272887,
		167,
		true
	},
	anniversary_task_title_8 = {
		273054,
		170,
		true
	},
	anniversary_task_title_9 = {
		273224,
		179,
		true
	},
	anniversary_task_title_10 = {
		273403,
		168,
		true
	},
	anniversary_task_title_11 = {
		273571,
		171,
		true
	},
	anniversary_task_title_12 = {
		273742,
		171,
		true
	},
	anniversary_task_title_13 = {
		273913,
		171,
		true
	},
	anniversary_task_title_14 = {
		274084,
		174,
		true
	},
	charge_scene_buy_confirm = {
		274258,
		167,
		true
	},
	charge_scene_buy_confirm_gold = {
		274425,
		172,
		true
	},
	charge_scene_batch_buy_tip = {
		274597,
		197,
		true
	},
	help_level_ui = {
		274794,
		968,
		true
	},
	guild_modify_info_tip = {
		275762,
		182,
		true
	},
	ai_change_1 = {
		275944,
		99,
		true
	},
	ai_change_2 = {
		276043,
		105,
		true
	},
	activity_shop_lable = {
		276148,
		130,
		true
	},
	word_bilibili = {
		276278,
		90,
		true
	},
	levelScene_tracking_error_pre = {
		276368,
		134,
		true
	},
	ship_limit_notice = {
		276502,
		112,
		true
	},
	idle = {
		276614,
		74,
		true
	},
	main_1 = {
		276688,
		82,
		true
	},
	main_2 = {
		276770,
		82,
		true
	},
	main_3 = {
		276852,
		82,
		true
	},
	complete = {
		276934,
		85,
		true
	},
	login = {
		277019,
		75,
		true
	},
	home = {
		277094,
		74,
		true
	},
	mail = {
		277168,
		81,
		true
	},
	mission = {
		277249,
		84,
		true
	},
	mission_complete = {
		277333,
		93,
		true
	},
	wedding = {
		277426,
		77,
		true
	},
	touch_head = {
		277503,
		80,
		true
	},
	touch_body = {
		277583,
		80,
		true
	},
	touch_special = {
		277663,
		84,
		true
	},
	gold = {
		277747,
		74,
		true
	},
	oil = {
		277821,
		73,
		true
	},
	diamond = {
		277894,
		77,
		true
	},
	word_photo_mode = {
		277971,
		85,
		true
	},
	word_video_mode = {
		278056,
		85,
		true
	},
	word_save_ok = {
		278141,
		109,
		true
	},
	word_save_video = {
		278250,
		119,
		true
	},
	reflux_help_tip = {
		278369,
		1079,
		true
	},
	reflux_pt_not_enough = {
		279448,
		102,
		true
	},
	reflux_word_1 = {
		279550,
		92,
		true
	},
	reflux_word_2 = {
		279642,
		86,
		true
	},
	ship_hunting_level_tips = {
		279728,
		178,
		true
	},
	acquisitionmode_is_not_open = {
		279906,
		121,
		true
	},
	collect_chapter_is_activation = {
		280027,
		140,
		true
	},
	levelScene_chapter_is_activation = {
		280167,
		183,
		true
	},
	resource_verify_warn = {
		280350,
		236,
		true
	},
	resource_verify_fail = {
		280586,
		177,
		true
	},
	resource_verify_success = {
		280763,
		111,
		true
	},
	resource_clear_all = {
		280874,
		151,
		true
	},
	acl_oil_count = {
		281025,
		92,
		true
	},
	acl_oil_total_count = {
		281117,
		104,
		true
	},
	word_take_video_tip = {
		281221,
		145,
		true
	},
	word_snapshot_share_title = {
		281366,
		116,
		true
	},
	word_snapshot_share_agreement = {
		281482,
		506,
		true
	},
	skin_remain_time = {
		281988,
		98,
		true
	},
	word_museum_1 = {
		282086,
		128,
		true
	},
	word_museum_help = {
		282214,
		748,
		true
	},
	goldship_help_tip = {
		282962,
		912,
		true
	},
	metalgearsub_help_tip = {
		283874,
		1497,
		true
	},
	acl_gold_count = {
		285371,
		93,
		true
	},
	acl_gold_total_count = {
		285464,
		105,
		true
	},
	discount_time = {
		285569,
		142,
		true
	},
	commander_talent_not_exist = {
		285711,
		105,
		true
	},
	commander_replace_talent_not_exist = {
		285816,
		119,
		true
	},
	commander_talent_learned = {
		285935,
		108,
		true
	},
	commander_talent_learn_erro = {
		286043,
		114,
		true
	},
	commander_not_exist = {
		286157,
		104,
		true
	},
	commander_fleet_not_exist = {
		286261,
		107,
		true
	},
	commander_fleet_pos_not_exist = {
		286368,
		120,
		true
	},
	commander_equip_to_fleet_erro = {
		286488,
		116,
		true
	},
	commander_acquire_erro = {
		286604,
		109,
		true
	},
	commander_lock_erro = {
		286713,
		97,
		true
	},
	commander_reset_talent_time_no_rearch = {
		286810,
		119,
		true
	},
	commander_reset_talent_is_not_need = {
		286929,
		113,
		true
	},
	commander_reset_talent_success = {
		287042,
		112,
		true
	},
	commander_reset_talent_erro = {
		287154,
		111,
		true
	},
	commander_can_not_be_upgrade = {
		287265,
		116,
		true
	},
	commander_anyone_is_in_fleet = {
		287381,
		125,
		true
	},
	commander_is_in_fleet = {
		287506,
		109,
		true
	},
	commander_play_erro = {
		287615,
		97,
		true
	},
	ship_equip_same_group_equipment = {
		287712,
		125,
		true
	},
	summary_page_un_rearch = {
		287837,
		95,
		true
	},
	player_summary_from = {
		287932,
		104,
		true
	},
	player_summary_data = {
		288036,
		95,
		true
	},
	commander_exp_overflow_tip = {
		288131,
		148,
		true
	},
	commander_reset_talent_tip = {
		288279,
		115,
		true
	},
	commander_reset_talent = {
		288394,
		98,
		true
	},
	commander_select_min_cnt = {
		288492,
		114,
		true
	},
	commander_select_max = {
		288606,
		102,
		true
	},
	commander_lock_done = {
		288708,
		98,
		true
	},
	commander_unlock_done = {
		288806,
		100,
		true
	},
	commander_get_1 = {
		288906,
		121,
		true
	},
	commander_get = {
		289027,
		117,
		true
	},
	commander_build_done = {
		289144,
		108,
		true
	},
	commander_build_erro = {
		289252,
		110,
		true
	},
	commander_get_skills_done = {
		289362,
		113,
		true
	},
	collection_way_is_unopen = {
		289475,
		118,
		true
	},
	commander_can_not_select_same_group = {
		289593,
		126,
		true
	},
	commander_capcity_is_max = {
		289719,
		100,
		true
	},
	commander_reserve_count_is_max = {
		289819,
		118,
		true
	},
	commander_build_pool_tip = {
		289937,
		147,
		true
	},
	commander_select_matiral_erro = {
		290084,
		160,
		true
	},
	commander_material_is_rarity = {
		290244,
		147,
		true
	},
	commander_material_is_maxLevel = {
		290391,
		170,
		true
	},
	charge_commander_bag_max = {
		290561,
		149,
		true
	},
	shop_extendcommander_success = {
		290710,
		116,
		true
	},
	commander_skill_point_noengough = {
		290826,
		110,
		true
	},
	buildship_new_tip = {
		290936,
		158,
		true
	},
	buildship_heavy_tip = {
		291094,
		134,
		true
	},
	buildship_light_tip = {
		291228,
		136,
		true
	},
	buildship_special_tip = {
		291364,
		122,
		true
	},
	Normalbuild_URexchange_help = {
		291486,
		604,
		true
	},
	Normalbuild_URexchange_text1 = {
		292090,
		106,
		true
	},
	Normalbuild_URexchange_text2 = {
		292196,
		104,
		true
	},
	Normalbuild_URexchange_text3 = {
		292300,
		113,
		true
	},
	Normalbuild_URexchange_text4 = {
		292413,
		104,
		true
	},
	Normalbuild_URexchange_warning1 = {
		292517,
		113,
		true
	},
	Normalbuild_URexchange_warning3 = {
		292630,
		205,
		true
	},
	Normalbuild_URexchange_confirm = {
		292835,
		142,
		true
	},
	open_skill_pos = {
		292977,
		189,
		true
	},
	open_skill_pos_discount = {
		293166,
		222,
		true
	},
	event_recommend_fail = {
		293388,
		108,
		true
	},
	newplayer_help_tip = {
		293496,
		991,
		true
	},
	newplayer_notice_1 = {
		294487,
		121,
		true
	},
	newplayer_notice_2 = {
		294608,
		121,
		true
	},
	newplayer_notice_3 = {
		294729,
		121,
		true
	},
	newplayer_notice_4 = {
		294850,
		115,
		true
	},
	newplayer_notice_5 = {
		294965,
		115,
		true
	},
	newplayer_notice_6 = {
		295080,
		160,
		true
	},
	newplayer_notice_7 = {
		295240,
		118,
		true
	},
	newplayer_notice_8 = {
		295358,
		155,
		true
	},
	tec_catchup_1 = {
		295513,
		83,
		true
	},
	tec_catchup_2 = {
		295596,
		83,
		true
	},
	tec_catchup_3 = {
		295679,
		83,
		true
	},
	tec_catchup_4 = {
		295762,
		83,
		true
	},
	tec_catchup_5 = {
		295845,
		83,
		true
	},
	tec_notice = {
		295928,
		121,
		true
	},
	tec_notice_not_open_tip = {
		296049,
		139,
		true
	},
	apply_permission_camera_tip1 = {
		296188,
		146,
		true
	},
	apply_permission_camera_tip2 = {
		296334,
		160,
		true
	},
	apply_permission_camera_tip3 = {
		296494,
		155,
		true
	},
	apply_permission_record_audio_tip1 = {
		296649,
		158,
		true
	},
	apply_permission_record_audio_tip2 = {
		296807,
		166,
		true
	},
	apply_permission_record_audio_tip3 = {
		296973,
		161,
		true
	},
	nine_choose_one = {
		297134,
		210,
		true
	},
	help_commander_info = {
		297344,
		810,
		true
	},
	help_commander_play = {
		298154,
		810,
		true
	},
	help_commander_ability = {
		298964,
		813,
		true
	},
	story_skip_confirm = {
		299777,
		199,
		true
	},
	commander_ability_replace_warning = {
		299976,
		140,
		true
	},
	help_command_room = {
		300116,
		808,
		true
	},
	commander_build_rate_tip = {
		300924,
		145,
		true
	},
	help_activity_bossbattle = {
		301069,
		1040,
		true
	},
	commander_is_in_fleet_already = {
		302109,
		130,
		true
	},
	commander_material_is_in_fleet_tip = {
		302239,
		144,
		true
	},
	commander_main_pos = {
		302383,
		91,
		true
	},
	commander_assistant_pos = {
		302474,
		96,
		true
	},
	comander_repalce_tip = {
		302570,
		152,
		true
	},
	commander_lock_tip = {
		302722,
		133,
		true
	},
	commander_is_in_battle = {
		302855,
		116,
		true
	},
	commander_rename_warning = {
		302971,
		164,
		true
	},
	commander_rename_coldtime_tip = {
		303135,
		125,
		true
	},
	commander_rename_success_tip = {
		303260,
		104,
		true
	},
	amercian_notice_1 = {
		303364,
		184,
		true
	},
	amercian_notice_2 = {
		303548,
		151,
		true
	},
	amercian_notice_3 = {
		303699,
		116,
		true
	},
	amercian_notice_4 = {
		303815,
		96,
		true
	},
	amercian_notice_5 = {
		303911,
		99,
		true
	},
	amercian_notice_6 = {
		304010,
		187,
		true
	},
	ranking_word_1 = {
		304197,
		90,
		true
	},
	ranking_word_2 = {
		304287,
		87,
		true
	},
	ranking_word_3 = {
		304374,
		87,
		true
	},
	ranking_word_4 = {
		304461,
		90,
		true
	},
	ranking_word_5 = {
		304551,
		84,
		true
	},
	ranking_word_6 = {
		304635,
		84,
		true
	},
	ranking_word_7 = {
		304719,
		90,
		true
	},
	ranking_word_8 = {
		304809,
		84,
		true
	},
	ranking_word_9 = {
		304893,
		84,
		true
	},
	ranking_word_10 = {
		304977,
		88,
		true
	},
	spece_illegal_tip = {
		305065,
		99,
		true
	},
	utaware_warmup_notice = {
		305164,
		902,
		true
	},
	utaware_formal_notice = {
		306066,
		648,
		true
	},
	npc_learn_skill_tip = {
		306714,
		184,
		true
	},
	npc_upgrade_max_level = {
		306898,
		131,
		true
	},
	npc_propse_tip = {
		307029,
		117,
		true
	},
	npc_strength_tip = {
		307146,
		185,
		true
	},
	npc_breakout_tip = {
		307331,
		185,
		true
	},
	word_chuansong = {
		307516,
		90,
		true
	},
	npc_evaluation_tip = {
		307606,
		127,
		true
	},
	map_event_skip = {
		307733,
		108,
		true
	},
	map_event_stop_tip = {
		307841,
		157,
		true
	},
	map_event_stop_battle_tip = {
		307998,
		164,
		true
	},
	map_event_stop_battle_tip_2 = {
		308162,
		166,
		true
	},
	map_event_stop_story_tip = {
		308328,
		160,
		true
	},
	map_event_save_nekone = {
		308488,
		126,
		true
	},
	map_event_save_rurutie = {
		308614,
		134,
		true
	},
	map_event_memory_collected = {
		308748,
		143,
		true
	},
	map_event_save_kizuna = {
		308891,
		126,
		true
	},
	five_choose_one = {
		309017,
		213,
		true
	},
	ship_preference_common = {
		309230,
		133,
		true
	},
	draw_big_luck_1 = {
		309363,
		118,
		true
	},
	draw_big_luck_2 = {
		309481,
		131,
		true
	},
	draw_big_luck_3 = {
		309612,
		115,
		true
	},
	draw_medium_luck_1 = {
		309727,
		112,
		true
	},
	draw_medium_luck_2 = {
		309839,
		118,
		true
	},
	draw_medium_luck_3 = {
		309957,
		115,
		true
	},
	draw_little_luck_1 = {
		310072,
		124,
		true
	},
	draw_little_luck_2 = {
		310196,
		121,
		true
	},
	draw_little_luck_3 = {
		310317,
		127,
		true
	},
	ship_preference_non = {
		310444,
		126,
		true
	},
	school_title_dajiangtang = {
		310570,
		97,
		true
	},
	school_title_zhihuimiao = {
		310667,
		96,
		true
	},
	school_title_shitang = {
		310763,
		96,
		true
	},
	school_title_xiaomaibu = {
		310859,
		95,
		true
	},
	school_title_shangdian = {
		310954,
		98,
		true
	},
	school_title_xueyuan = {
		311052,
		96,
		true
	},
	school_title_shoucang = {
		311148,
		94,
		true
	},
	school_title_xiaoyouxiting = {
		311242,
		99,
		true
	},
	tag_level_fighting = {
		311341,
		91,
		true
	},
	tag_level_oni = {
		311432,
		89,
		true
	},
	tag_level_bomb = {
		311521,
		90,
		true
	},
	ui_word_levelui2_inevent = {
		311611,
		97,
		true
	},
	exit_backyard_exp_display = {
		311708,
		120,
		true
	},
	help_monopoly = {
		311828,
		1416,
		true
	},
	md5_error = {
		313244,
		127,
		true
	},
	world_boss_help = {
		313371,
		4330,
		true
	},
	world_boss_tip = {
		317701,
		159,
		true
	},
	world_boss_award_limit = {
		317860,
		157,
		true
	},
	backyard_is_loading = {
		318017,
		113,
		true
	},
	levelScene_loop_help_tip = {
		318130,
		2330,
		true
	},
	no_airspace_competition = {
		320460,
		102,
		true
	},
	air_supremacy_value = {
		320562,
		92,
		true
	},
	read_the_user_agreement = {
		320654,
		114,
		true
	},
	award_max_warning = {
		320768,
		171,
		true
	},
	sub_item_warning = {
		320939,
		105,
		true
	},
	select_award_warning = {
		321044,
		105,
		true
	},
	no_item_selected_tip = {
		321149,
		112,
		true
	},
	backyard_traning_tip = {
		321261,
		154,
		true
	},
	backyard_rest_tip = {
		321415,
		111,
		true
	},
	backyard_class_tip = {
		321526,
		118,
		true
	},
	medal_notice_1 = {
		321644,
		96,
		true
	},
	medal_notice_2 = {
		321740,
		87,
		true
	},
	medal_help_tip = {
		321827,
		1420,
		true
	},
	trophy_achieved = {
		323247,
		94,
		true
	},
	text_shop = {
		323341,
		80,
		true
	},
	text_confirm = {
		323421,
		83,
		true
	},
	text_cancel = {
		323504,
		82,
		true
	},
	text_cancel_fight = {
		323586,
		93,
		true
	},
	text_goon_fight = {
		323679,
		91,
		true
	},
	text_exit = {
		323770,
		80,
		true
	},
	text_clear = {
		323850,
		81,
		true
	},
	text_apply = {
		323931,
		81,
		true
	},
	text_buy = {
		324012,
		79,
		true
	},
	text_forward = {
		324091,
		88,
		true
	},
	text_prepage = {
		324179,
		85,
		true
	},
	text_nextpage = {
		324264,
		86,
		true
	},
	text_exchange = {
		324350,
		84,
		true
	},
	text_retreat = {
		324434,
		83,
		true
	},
	text_goto = {
		324517,
		80,
		true
	},
	level_scene_title_word_1 = {
		324597,
		98,
		true
	},
	level_scene_title_word_2 = {
		324695,
		107,
		true
	},
	level_scene_title_word_3 = {
		324802,
		98,
		true
	},
	level_scene_title_word_4 = {
		324900,
		95,
		true
	},
	level_scene_title_word_5 = {
		324995,
		95,
		true
	},
	ambush_display_0 = {
		325090,
		86,
		true
	},
	ambush_display_1 = {
		325176,
		86,
		true
	},
	ambush_display_2 = {
		325262,
		86,
		true
	},
	ambush_display_3 = {
		325348,
		83,
		true
	},
	ambush_display_4 = {
		325431,
		83,
		true
	},
	ambush_display_5 = {
		325514,
		86,
		true
	},
	ambush_display_6 = {
		325600,
		86,
		true
	},
	black_white_grid_notice = {
		325686,
		1309,
		true
	},
	black_white_grid_reset = {
		326995,
		99,
		true
	},
	black_white_grid_switch_tip = {
		327094,
		127,
		true
	},
	no_way_to_escape = {
		327221,
		92,
		true
	},
	word_attr_ac = {
		327313,
		82,
		true
	},
	help_battle_ac = {
		327395,
		1439,
		true
	},
	help_attribute_dodge_limit = {
		328834,
		312,
		true
	},
	refuse_friend = {
		329146,
		96,
		true
	},
	refuse_and_add_into_bl = {
		329242,
		110,
		true
	},
	tech_simulate_closed = {
		329352,
		117,
		true
	},
	tech_simulate_quit = {
		329469,
		119,
		true
	},
	technology_uplevel_error_no_res = {
		329588,
		253,
		true
	},
	help_technologytree = {
		329841,
		1850,
		true
	},
	tech_change_version_mark = {
		331691,
		100,
		true
	},
	technology_uplevel_error_studying = {
		331791,
		174,
		true
	},
	fate_attr_word = {
		331965,
		114,
		true
	},
	fate_phase_word = {
		332079,
		94,
		true
	},
	blueprint_simulation_confirm = {
		332173,
		254,
		true
	},
	blueprint_simulation_confirm_19901 = {
		332427,
		420,
		true
	},
	blueprint_simulation_confirm_19902 = {
		332847,
		401,
		true
	},
	blueprint_simulation_confirm_39903 = {
		333248,
		384,
		true
	},
	blueprint_simulation_confirm_39904 = {
		333632,
		393,
		true
	},
	blueprint_simulation_confirm_49902 = {
		334025,
		388,
		true
	},
	blueprint_simulation_confirm_99901 = {
		334413,
		385,
		true
	},
	blueprint_simulation_confirm_29903 = {
		334798,
		381,
		true
	},
	blueprint_simulation_confirm_29904 = {
		335179,
		385,
		true
	},
	blueprint_simulation_confirm_49903 = {
		335564,
		379,
		true
	},
	blueprint_simulation_confirm_49904 = {
		335943,
		385,
		true
	},
	blueprint_simulation_confirm_89902 = {
		336328,
		390,
		true
	},
	blueprint_simulation_confirm_19903 = {
		336718,
		387,
		true
	},
	blueprint_simulation_confirm_39905 = {
		337105,
		386,
		true
	},
	blueprint_simulation_confirm_49905 = {
		337491,
		400,
		true
	},
	blueprint_simulation_confirm_49906 = {
		337891,
		357,
		true
	},
	blueprint_simulation_confirm_69901 = {
		338248,
		410,
		true
	},
	blueprint_simulation_confirm_29905 = {
		338658,
		389,
		true
	},
	blueprint_simulation_confirm_49907 = {
		339047,
		396,
		true
	},
	blueprint_simulation_confirm_59901 = {
		339443,
		380,
		true
	},
	blueprint_simulation_confirm_79901 = {
		339823,
		366,
		true
	},
	blueprint_simulation_confirm_89903 = {
		340189,
		410,
		true
	},
	blueprint_simulation_confirm_19904 = {
		340599,
		396,
		true
	},
	blueprint_simulation_confirm_39906 = {
		340995,
		386,
		true
	},
	blueprint_simulation_confirm_49908 = {
		341381,
		404,
		true
	},
	blueprint_simulation_confirm_49909 = {
		341785,
		401,
		true
	},
	blueprint_simulation_confirm_99902 = {
		342186,
		399,
		true
	},
	electrotherapy_wanning = {
		342585,
		107,
		true
	},
	siren_chase_warning = {
		342692,
		104,
		true
	},
	memorybook_get_award_tip = {
		342796,
		161,
		true
	},
	memorybook_notice = {
		342957,
		687,
		true
	},
	word_votes = {
		343644,
		86,
		true
	},
	number_0 = {
		343730,
		75,
		true
	},
	intimacy_desc_propose_vertical = {
		343805,
		304,
		true
	},
	without_selected_ship = {
		344109,
		115,
		true
	},
	index_all = {
		344224,
		79,
		true
	},
	index_fleetfront = {
		344303,
		92,
		true
	},
	index_fleetrear = {
		344395,
		91,
		true
	},
	index_shipType_quZhu = {
		344486,
		90,
		true
	},
	index_shipType_qinXun = {
		344576,
		91,
		true
	},
	index_shipType_zhongXun = {
		344667,
		93,
		true
	},
	index_shipType_zhanLie = {
		344760,
		92,
		true
	},
	index_shipType_hangMu = {
		344852,
		91,
		true
	},
	index_shipType_weiXiu = {
		344943,
		91,
		true
	},
	index_shipType_qianTing = {
		345034,
		93,
		true
	},
	index_other = {
		345127,
		81,
		true
	},
	index_rare2 = {
		345208,
		81,
		true
	},
	index_rare3 = {
		345289,
		81,
		true
	},
	index_rare4 = {
		345370,
		81,
		true
	},
	index_rare5 = {
		345451,
		84,
		true
	},
	index_rare6 = {
		345535,
		87,
		true
	},
	warning_mail_max_1 = {
		345622,
		154,
		true
	},
	warning_mail_max_2 = {
		345776,
		131,
		true
	},
	return_award_bind_success = {
		345907,
		101,
		true
	},
	return_award_bind_erro = {
		346008,
		100,
		true
	},
	rename_commander_erro = {
		346108,
		99,
		true
	},
	change_display_medal_success = {
		346207,
		116,
		true
	},
	limit_skin_time_day = {
		346323,
		101,
		true
	},
	limit_skin_time_day_min = {
		346424,
		116,
		true
	},
	limit_skin_time_min = {
		346540,
		104,
		true
	},
	limit_skin_time_overtime = {
		346644,
		97,
		true
	},
	limit_skin_time_before_maintenance = {
		346741,
		117,
		true
	},
	award_window_pt_title = {
		346858,
		96,
		true
	},
	return_have_participated_in_act = {
		346954,
		119,
		true
	},
	input_returner_code = {
		347073,
		98,
		true
	},
	dress_up_success = {
		347171,
		92,
		true
	},
	already_have_the_skin = {
		347263,
		106,
		true
	},
	exchange_limit_skin_tip = {
		347369,
		149,
		true
	},
	returner_help = {
		347518,
		1631,
		true
	},
	attire_time_stamp = {
		349149,
		102,
		true
	},
	pray_build_select_ship_instruction = {
		349251,
		122,
		true
	},
	warning_pray_build_pool = {
		349373,
		181,
		true
	},
	error_pray_select_ship_max = {
		349554,
		108,
		true
	},
	tip_pray_build_pool_success = {
		349662,
		103,
		true
	},
	tip_pray_build_pool_fail = {
		349765,
		100,
		true
	},
	pray_build_help = {
		349865,
		1644,
		true
	},
	bismarck_award_tip = {
		351509,
		115,
		true
	},
	bismarck_chapter_desc = {
		351624,
		161,
		true
	},
	returner_push_success = {
		351785,
		97,
		true
	},
	returner_max_count = {
		351882,
		106,
		true
	},
	returner_push_tip = {
		351988,
		236,
		true
	},
	returner_match_tip = {
		352224,
		233,
		true
	},
	return_lock_tip = {
		352457,
		135,
		true
	},
	challenge_help = {
		352592,
		1284,
		true
	},
	challenge_casual_reset = {
		353876,
		144,
		true
	},
	challenge_infinite_reset = {
		354020,
		146,
		true
	},
	challenge_normal_reset = {
		354166,
		111,
		true
	},
	challenge_casual_click_switch = {
		354277,
		155,
		true
	},
	challenge_infinite_click_switch = {
		354432,
		157,
		true
	},
	challenge_season_update = {
		354589,
		111,
		true
	},
	challenge_season_update_casual_clear = {
		354700,
		202,
		true
	},
	challenge_season_update_infinite_clear = {
		354902,
		204,
		true
	},
	challenge_season_update_casual_switch = {
		355106,
		245,
		true
	},
	challenge_season_update_infinite_switch = {
		355351,
		247,
		true
	},
	challenge_combat_score = {
		355598,
		103,
		true
	},
	challenge_share_progress = {
		355701,
		115,
		true
	},
	challenge_share = {
		355816,
		82,
		true
	},
	challenge_expire_warn = {
		355898,
		143,
		true
	},
	challenge_normal_tip = {
		356041,
		136,
		true
	},
	challenge_unlimited_tip = {
		356177,
		130,
		true
	},
	commander_prefab_rename_success = {
		356307,
		107,
		true
	},
	commander_prefab_name = {
		356414,
		99,
		true
	},
	commander_prefab_rename_time = {
		356513,
		118,
		true
	},
	commander_build_solt_deficiency = {
		356631,
		116,
		true
	},
	commander_select_box_tip = {
		356747,
		166,
		true
	},
	challenge_end_tip = {
		356913,
		96,
		true
	},
	pass_times = {
		357009,
		86,
		true
	},
	list_empty_tip_billboardui = {
		357095,
		108,
		true
	},
	list_empty_tip_equipmentdesignui = {
		357203,
		123,
		true
	},
	list_empty_tip_storehouseui_equip = {
		357326,
		124,
		true
	},
	list_empty_tip_storehouseui_item = {
		357450,
		120,
		true
	},
	list_empty_tip_eventui = {
		357570,
		113,
		true
	},
	list_empty_tip_guildrequestui = {
		357683,
		114,
		true
	},
	list_empty_tip_joinguildui = {
		357797,
		120,
		true
	},
	list_empty_tip_friendui = {
		357917,
		99,
		true
	},
	list_empty_tip_friendui_search = {
		358016,
		127,
		true
	},
	list_empty_tip_friendui_request = {
		358143,
		113,
		true
	},
	list_empty_tip_friendui_black = {
		358256,
		114,
		true
	},
	list_empty_tip_dockyardui = {
		358370,
		116,
		true
	},
	list_empty_tip_taskscene = {
		358486,
		112,
		true
	},
	empty_tip_mailboxui = {
		358598,
		107,
		true
	},
	words_settings_unlock_ship = {
		358705,
		102,
		true
	},
	words_settings_resolve_equip = {
		358807,
		104,
		true
	},
	words_settings_unlock_commander = {
		358911,
		110,
		true
	},
	words_settings_create_inherit = {
		359021,
		108,
		true
	},
	tips_fail_secondarypwd_much_times = {
		359129,
		171,
		true
	},
	words_desc_unlock = {
		359300,
		123,
		true
	},
	words_desc_resolve_equip = {
		359423,
		131,
		true
	},
	words_desc_create_inherit = {
		359554,
		132,
		true
	},
	words_desc_close_password = {
		359686,
		132,
		true
	},
	words_desc_change_settings = {
		359818,
		145,
		true
	},
	words_set_password = {
		359963,
		94,
		true
	},
	words_information = {
		360057,
		87,
		true
	},
	Word_Ship_Exp_Buff = {
		360144,
		94,
		true
	},
	secondarypassword_incorrectpwd_error = {
		360238,
		156,
		true
	},
	secondary_password_help = {
		360394,
		1240,
		true
	},
	comic_help = {
		361634,
		465,
		true
	},
	secondarypassword_illegal_tip = {
		362099,
		130,
		true
	},
	pt_cosume = {
		362229,
		81,
		true
	},
	secondarypassword_confirm_tips = {
		362310,
		160,
		true
	},
	help_tempesteve = {
		362470,
		801,
		true
	},
	word_rest_times = {
		363271,
		125,
		true
	},
	common_buy_gold_success = {
		363396,
		136,
		true
	},
	harbour_bomb_tip = {
		363532,
		113,
		true
	},
	submarine_approach = {
		363645,
		94,
		true
	},
	submarine_approach_desc = {
		363739,
		139,
		true
	},
	desc_quick_play = {
		363878,
		97,
		true
	},
	text_win_condition = {
		363975,
		94,
		true
	},
	text_lose_condition = {
		364069,
		95,
		true
	},
	text_rest_HP = {
		364164,
		88,
		true
	},
	desc_defense_reward = {
		364252,
		128,
		true
	},
	desc_base_hp = {
		364380,
		96,
		true
	},
	map_event_open = {
		364476,
		99,
		true
	},
	word_reward = {
		364575,
		81,
		true
	},
	tips_dispense_completed = {
		364656,
		99,
		true
	},
	tips_firework_completed = {
		364755,
		105,
		true
	},
	help_summer_feast = {
		364860,
		803,
		true
	},
	help_firework_produce = {
		365663,
		491,
		true
	},
	help_firework = {
		366154,
		1195,
		true
	},
	help_summer_shrine = {
		367349,
		1071,
		true
	},
	help_summer_food = {
		368420,
		1505,
		true
	},
	help_summer_shooting = {
		369925,
		962,
		true
	},
	help_summer_stamp = {
		370887,
		307,
		true
	},
	tips_summergame_exit = {
		371194,
		166,
		true
	},
	tips_shrine_buff = {
		371360,
		112,
		true
	},
	tips_shrine_nobuff = {
		371472,
		139,
		true
	},
	paint_hide_other_obj_tip = {
		371611,
		106,
		true
	},
	help_vote = {
		371717,
		5066,
		true
	},
	tips_firework_exit = {
		376783,
		131,
		true
	},
	result_firework_produce = {
		376914,
		123,
		true
	},
	tag_level_narrative = {
		377037,
		95,
		true
	},
	vote_get_book = {
		377132,
		98,
		true
	},
	vote_book_is_over = {
		377230,
		133,
		true
	},
	vote_fame_tip = {
		377363,
		161,
		true
	},
	word_maintain = {
		377524,
		86,
		true
	},
	name_zhanliejahe = {
		377610,
		101,
		true
	},
	change_skin_secretary_ship_success = {
		377711,
		135,
		true
	},
	change_skin_secretary_ship = {
		377846,
		117,
		true
	},
	word_billboard = {
		377963,
		87,
		true
	},
	word_easy = {
		378050,
		79,
		true
	},
	word_normal_junhe = {
		378129,
		87,
		true
	},
	word_hard = {
		378216,
		79,
		true
	},
	word_special_challenge_ticket = {
		378295,
		108,
		true
	},
	tip_exchange_ticket = {
		378403,
		155,
		true
	},
	dont_remind = {
		378558,
		87,
		true
	},
	worldbossex_help = {
		378645,
		969,
		true
	},
	ship_formationUI_fleetName_easy = {
		379614,
		107,
		true
	},
	ship_formationUI_fleetName_normal = {
		379721,
		109,
		true
	},
	ship_formationUI_fleetName_hard = {
		379830,
		107,
		true
	},
	ship_formationUI_fleetName_extra = {
		379937,
		104,
		true
	},
	ship_formationUI_fleetName_easy_ss = {
		380041,
		116,
		true
	},
	ship_formationUI_fleetName_normal_ss = {
		380157,
		118,
		true
	},
	ship_formationUI_fleetName_hard_ss = {
		380275,
		116,
		true
	},
	ship_formationUI_fleetName_extra_ss = {
		380391,
		113,
		true
	},
	text_consume = {
		380504,
		83,
		true
	},
	text_inconsume = {
		380587,
		87,
		true
	},
	pt_ship_now = {
		380674,
		90,
		true
	},
	pt_ship_goal = {
		380764,
		91,
		true
	},
	option_desc1 = {
		380855,
		127,
		true
	},
	option_desc2 = {
		380982,
		146,
		true
	},
	option_desc3 = {
		381128,
		158,
		true
	},
	option_desc4 = {
		381286,
		210,
		true
	},
	option_desc5 = {
		381496,
		134,
		true
	},
	option_desc6 = {
		381630,
		149,
		true
	},
	option_desc10 = {
		381779,
		141,
		true
	},
	option_desc11 = {
		381920,
		1452,
		true
	},
	music_collection = {
		383372,
		758,
		true
	},
	music_main = {
		384130,
		1010,
		true
	},
	music_juus = {
		385140,
		465,
		true
	},
	doa_collection = {
		385605,
		684,
		true
	},
	ins_word_day = {
		386289,
		84,
		true
	},
	ins_word_hour = {
		386373,
		88,
		true
	},
	ins_word_minu = {
		386461,
		88,
		true
	},
	ins_word_like = {
		386549,
		86,
		true
	},
	ins_click_like_success = {
		386635,
		98,
		true
	},
	ins_push_comment_success = {
		386733,
		100,
		true
	},
	skinshop_live2d_fliter_failed = {
		386833,
		126,
		true
	},
	help_music_game = {
		386959,
		1231,
		true
	},
	restart_music_game = {
		388190,
		143,
		true
	},
	reselect_music_game = {
		388333,
		144,
		true
	},
	hololive_goodmorning = {
		388477,
		571,
		true
	},
	hololive_lianliankan = {
		389048,
		1165,
		true
	},
	hololive_dalaozhang = {
		390213,
		588,
		true
	},
	hololive_dashenling = {
		390801,
		869,
		true
	},
	pocky_jiujiu = {
		391670,
		88,
		true
	},
	pocky_jiujiu_desc = {
		391758,
		136,
		true
	},
	pocky_help = {
		391894,
		722,
		true
	},
	secretary_help = {
		392616,
		1478,
		true
	},
	secretary_unlock2 = {
		394094,
		105,
		true
	},
	secretary_unlock3 = {
		394199,
		105,
		true
	},
	secretary_unlock4 = {
		394304,
		105,
		true
	},
	secretary_unlock5 = {
		394409,
		106,
		true
	},
	secretary_closed = {
		394515,
		92,
		true
	},
	confirm_unlock = {
		394607,
		92,
		true
	},
	secretary_pos_save = {
		394699,
		122,
		true
	},
	secretary_pos_save_success = {
		394821,
		102,
		true
	},
	collection_help = {
		394923,
		346,
		true
	},
	juese_tiyan = {
		395269,
		220,
		true
	},
	resolve_amount_prefix = {
		395489,
		100,
		true
	},
	compose_amount_prefix = {
		395589,
		100,
		true
	},
	help_sub_limits = {
		395689,
		104,
		true
	},
	help_sub_display = {
		395793,
		105,
		true
	},
	confirm_unlock_ship_main = {
		395898,
		134,
		true
	},
	msgbox_text_confirm = {
		396032,
		90,
		true
	},
	msgbox_text_shop = {
		396122,
		87,
		true
	},
	msgbox_text_cancel = {
		396209,
		89,
		true
	},
	msgbox_text_cancel_g = {
		396298,
		91,
		true
	},
	msgbox_text_cancel_fight = {
		396389,
		100,
		true
	},
	msgbox_text_goon_fight = {
		396489,
		98,
		true
	},
	msgbox_text_exit = {
		396587,
		87,
		true
	},
	msgbox_text_clear = {
		396674,
		88,
		true
	},
	msgbox_text_apply = {
		396762,
		88,
		true
	},
	msgbox_text_buy = {
		396850,
		86,
		true
	},
	msgbox_text_noPos_buy = {
		396936,
		92,
		true
	},
	msgbox_text_noPos_clear = {
		397028,
		94,
		true
	},
	msgbox_text_noPos_intensify = {
		397122,
		98,
		true
	},
	msgbox_text_forward = {
		397220,
		95,
		true
	},
	msgbox_text_iknow = {
		397315,
		90,
		true
	},
	msgbox_text_prepage = {
		397405,
		92,
		true
	},
	msgbox_text_nextpage = {
		397497,
		93,
		true
	},
	msgbox_text_exchange = {
		397590,
		91,
		true
	},
	msgbox_text_retreat = {
		397681,
		90,
		true
	},
	msgbox_text_go = {
		397771,
		90,
		true
	},
	msgbox_text_consume = {
		397861,
		89,
		true
	},
	msgbox_text_inconsume = {
		397950,
		94,
		true
	},
	msgbox_text_unlock = {
		398044,
		89,
		true
	},
	msgbox_text_save = {
		398133,
		87,
		true
	},
	msgbox_text_replace = {
		398220,
		90,
		true
	},
	msgbox_text_unload = {
		398310,
		89,
		true
	},
	msgbox_text_modify = {
		398399,
		89,
		true
	},
	msgbox_text_breakthrough = {
		398488,
		95,
		true
	},
	msgbox_text_equipdetail = {
		398583,
		99,
		true
	},
	msgbox_text_use = {
		398682,
		86,
		true
	},
	common_flag_ship = {
		398768,
		89,
		true
	},
	fenjie_lantu_tip = {
		398857,
		137,
		true
	},
	msgbox_text_analyse = {
		398994,
		90,
		true
	},
	fragresolve_empty_tip = {
		399084,
		118,
		true
	},
	confirm_unlock_lv = {
		399202,
		123,
		true
	},
	shops_rest_day = {
		399325,
		103,
		true
	},
	title_limit_time = {
		399428,
		92,
		true
	},
	seven_choose_one = {
		399520,
		214,
		true
	},
	help_newyear_feast = {
		399734,
		967,
		true
	},
	help_newyear_shrine = {
		400701,
		1130,
		true
	},
	help_newyear_stamp = {
		401831,
		343,
		true
	},
	pt_reconfirm = {
		402174,
		126,
		true
	},
	qte_game_help = {
		402300,
		340,
		true
	},
	word_equipskin_type = {
		402640,
		89,
		true
	},
	word_equipskin_all = {
		402729,
		88,
		true
	},
	word_equipskin_cannon = {
		402817,
		91,
		true
	},
	word_equipskin_tarpedo = {
		402908,
		92,
		true
	},
	word_equipskin_aircraft = {
		403000,
		96,
		true
	},
	word_equipskin_aux = {
		403096,
		88,
		true
	},
	msgbox_repair = {
		403184,
		89,
		true
	},
	msgbox_repair_l2d = {
		403273,
		90,
		true
	},
	msgbox_repair_painting = {
		403363,
		98,
		true
	},
	word_no_cache = {
		403461,
		104,
		true
	},
	pile_game_notice = {
		403565,
		942,
		true
	},
	help_chunjie_stamp = {
		404507,
		312,
		true
	},
	help_chunjie_feast = {
		404819,
		558,
		true
	},
	help_chunjie_jiulou = {
		405377,
		824,
		true
	},
	special_animal1 = {
		406201,
		210,
		true
	},
	special_animal2 = {
		406411,
		204,
		true
	},
	special_animal3 = {
		406615,
		197,
		true
	},
	special_animal4 = {
		406812,
		199,
		true
	},
	special_animal5 = {
		407011,
		200,
		true
	},
	special_animal6 = {
		407211,
		185,
		true
	},
	special_animal7 = {
		407396,
		210,
		true
	},
	bulin_help = {
		407606,
		407,
		true
	},
	super_bulin = {
		408013,
		102,
		true
	},
	super_bulin_tip = {
		408115,
		120,
		true
	},
	bulin_tip1 = {
		408235,
		101,
		true
	},
	bulin_tip2 = {
		408336,
		110,
		true
	},
	bulin_tip3 = {
		408446,
		101,
		true
	},
	bulin_tip4 = {
		408547,
		119,
		true
	},
	bulin_tip5 = {
		408666,
		101,
		true
	},
	bulin_tip6 = {
		408767,
		107,
		true
	},
	bulin_tip7 = {
		408874,
		101,
		true
	},
	bulin_tip8 = {
		408975,
		110,
		true
	},
	bulin_tip9 = {
		409085,
		110,
		true
	},
	bulin_tip_other1 = {
		409195,
		137,
		true
	},
	bulin_tip_other2 = {
		409332,
		101,
		true
	},
	bulin_tip_other3 = {
		409433,
		138,
		true
	},
	monopoly_left_count = {
		409571,
		96,
		true
	},
	help_chunjie_monopoly = {
		409667,
		1017,
		true
	},
	monoply_drop_ship_step = {
		410684,
		143,
		true
	},
	lanternRiddles_wait_for_reanswer = {
		410827,
		130,
		true
	},
	lanternRiddles_answer_is_wrong = {
		410957,
		132,
		true
	},
	lanternRiddles_answer_is_right = {
		411089,
		113,
		true
	},
	lanternRiddles_gametip = {
		411202,
		940,
		true
	},
	LanternRiddle_wait_time_tip = {
		412142,
		110,
		true
	},
	LinkLinkGame_BestTime = {
		412252,
		98,
		true
	},
	LinkLinkGame_CurTime = {
		412350,
		97,
		true
	},
	sort_attribute = {
		412447,
		84,
		true
	},
	sort_intimacy = {
		412531,
		83,
		true
	},
	index_skin = {
		412614,
		83,
		true
	},
	index_reform = {
		412697,
		85,
		true
	},
	index_reform_cw = {
		412782,
		88,
		true
	},
	index_strengthen = {
		412870,
		89,
		true
	},
	index_special = {
		412959,
		83,
		true
	},
	index_propose_skin = {
		413042,
		94,
		true
	},
	index_not_obtained = {
		413136,
		91,
		true
	},
	index_no_limit = {
		413227,
		87,
		true
	},
	index_awakening = {
		413314,
		110,
		true
	},
	index_not_lvmax = {
		413424,
		88,
		true
	},
	index_spweapon = {
		413512,
		90,
		true
	},
	index_marry = {
		413602,
		84,
		true
	},
	decodegame_gametip = {
		413686,
		1094,
		true
	},
	indexsort_sort = {
		414780,
		84,
		true
	},
	indexsort_index = {
		414864,
		85,
		true
	},
	indexsort_camp = {
		414949,
		84,
		true
	},
	indexsort_type = {
		415033,
		84,
		true
	},
	indexsort_rarity = {
		415117,
		89,
		true
	},
	indexsort_extraindex = {
		415206,
		96,
		true
	},
	indexsort_label = {
		415302,
		85,
		true
	},
	indexsort_sorteng = {
		415387,
		85,
		true
	},
	indexsort_indexeng = {
		415472,
		87,
		true
	},
	indexsort_campeng = {
		415559,
		85,
		true
	},
	indexsort_rarityeng = {
		415644,
		89,
		true
	},
	indexsort_typeeng = {
		415733,
		85,
		true
	},
	indexsort_labeleng = {
		415818,
		87,
		true
	},
	fightfail_up = {
		415905,
		172,
		true
	},
	fightfail_equip = {
		416077,
		163,
		true
	},
	fight_strengthen = {
		416240,
		167,
		true
	},
	fightfail_noequip = {
		416407,
		126,
		true
	},
	fightfail_choiceequip = {
		416533,
		157,
		true
	},
	fightfail_choicestrengthen = {
		416690,
		165,
		true
	},
	sofmap_attention = {
		416855,
		272,
		true
	},
	sofmapsd_1 = {
		417127,
		161,
		true
	},
	sofmapsd_2 = {
		417288,
		146,
		true
	},
	sofmapsd_3 = {
		417434,
		130,
		true
	},
	sofmapsd_4 = {
		417564,
		123,
		true
	},
	inform_level_limit = {
		417687,
		130,
		true
	},
	["3match_tip"] = {
		417817,
		381,
		true
	},
	retire_selectzero = {
		418198,
		111,
		true
	},
	retire_marry_skin = {
		418309,
		101,
		true
	},
	undermist_tip = {
		418410,
		122,
		true
	},
	retire_1 = {
		418532,
		204,
		true
	},
	retire_2 = {
		418736,
		204,
		true
	},
	retire_3 = {
		418940,
		94,
		true
	},
	retire_rarity = {
		419034,
		94,
		true
	},
	retire_title = {
		419128,
		94,
		true
	},
	res_unlock_tip = {
		419222,
		108,
		true
	},
	res_wifi_tip = {
		419330,
		151,
		true
	},
	res_downloading = {
		419481,
		88,
		true
	},
	res_pic_new_tip = {
		419569,
		111,
		true
	},
	res_music_no_pre_tip = {
		419680,
		105,
		true
	},
	res_music_no_next_tip = {
		419785,
		109,
		true
	},
	res_music_new_tip = {
		419894,
		113,
		true
	},
	apple_link_title = {
		420007,
		113,
		true
	},
	retire_setting_help = {
		420120,
		505,
		true
	},
	activity_shop_exchange_count = {
		420625,
		107,
		true
	},
	shops_msgbox_exchange_count = {
		420732,
		104,
		true
	},
	shops_msgbox_output = {
		420836,
		95,
		true
	},
	shop_word_exchange = {
		420931,
		89,
		true
	},
	shop_word_cancel = {
		421020,
		87,
		true
	},
	title_item_ways = {
		421107,
		141,
		true
	},
	item_lack_title = {
		421248,
		145,
		true
	},
	oil_buy_tip_2 = {
		421393,
		456,
		true
	},
	target_chapter_is_lock = {
		421849,
		113,
		true
	},
	ship_book = {
		421962,
		102,
		true
	},
	month_sign_resign = {
		422064,
		151,
		true
	},
	collect_tip = {
		422215,
		133,
		true
	},
	collect_tip2 = {
		422348,
		137,
		true
	},
	word_weakness = {
		422485,
		83,
		true
	},
	special_operation_tip1 = {
		422568,
		110,
		true
	},
	special_operation_tip2 = {
		422678,
		113,
		true
	},
	area_lock = {
		422791,
		97,
		true
	},
	equipment_upgrade_equipped_tag = {
		422888,
		106,
		true
	},
	equipment_upgrade_spare_tag = {
		422994,
		103,
		true
	},
	equipment_upgrade_help = {
		423097,
		1081,
		true
	},
	equipment_upgrade_title = {
		424178,
		99,
		true
	},
	equipment_upgrade_coin_consume = {
		424277,
		106,
		true
	},
	equipment_upgrade_quick_interface_source_chosen = {
		424383,
		126,
		true
	},
	equipment_upgrade_quick_interface_materials_consume = {
		424509,
		140,
		true
	},
	equipment_upgrade_feedback_lack_of_materials = {
		424649,
		120,
		true
	},
	equipment_upgrade_feedback_equipment_consume = {
		424769,
		192,
		true
	},
	equipment_upgrade_feedback_equipment_can_be_produced = {
		424961,
		177,
		true
	},
	equipment_upgrade_quick_interface_feedback_source_chosen = {
		425138,
		136,
		true
	},
	equipment_upgrade_feedback_lack_of_equipment = {
		425274,
		126,
		true
	},
	equipment_upgrade_equipped_unavailable = {
		425400,
		183,
		true
	},
	equipment_upgrade_initial_node = {
		425583,
		134,
		true
	},
	equipment_upgrade_feedback_compose_tip = {
		425717,
		217,
		true
	},
	discount_coupon_tip = {
		425934,
		193,
		true
	},
	pizzahut_help = {
		426127,
		793,
		true
	},
	towerclimbing_gametip = {
		426920,
		670,
		true
	},
	qingdianguangchang_help = {
		427590,
		599,
		true
	},
	building_tip = {
		428189,
		195,
		true
	},
	building_upgrade_tip = {
		428384,
		126,
		true
	},
	msgbox_text_upgrade = {
		428510,
		90,
		true
	},
	towerclimbing_sign_help = {
		428600,
		692,
		true
	},
	building_complete_tip = {
		429292,
		97,
		true
	},
	backyard_theme_refresh_time_tip = {
		429389,
		113,
		true
	},
	backyard_theme_total_print = {
		429502,
		96,
		true
	},
	backyard_theme_shop_title = {
		429598,
		101,
		true
	},
	backyard_theme_mine_title = {
		429699,
		101,
		true
	},
	backyard_theme_collection_title = {
		429800,
		107,
		true
	},
	backyard_theme_ban_upload_tip = {
		429907,
		171,
		true
	},
	backyard_theme_upload_over_maxcnt = {
		430078,
		180,
		true
	},
	backyard_theme_apply_tip1 = {
		430258,
		144,
		true
	},
	backyard_theme_word_buy = {
		430402,
		93,
		true
	},
	backyard_theme_word_apply = {
		430495,
		95,
		true
	},
	backyard_theme_apply_success = {
		430590,
		104,
		true
	},
	backyard_theme_unload_success = {
		430694,
		111,
		true
	},
	backyard_theme_upload_success = {
		430805,
		105,
		true
	},
	backyard_theme_delete_success = {
		430910,
		105,
		true
	},
	backyard_theme_apply_tip2 = {
		431015,
		107,
		true
	},
	backyard_theme_upload_cnt = {
		431122,
		111,
		true
	},
	backyard_theme_upload_time = {
		431233,
		103,
		true
	},
	backyard_theme_word_like = {
		431336,
		94,
		true
	},
	backyard_theme_word_collection = {
		431430,
		100,
		true
	},
	backyard_theme_cancel_collection = {
		431530,
		117,
		true
	},
	backyard_theme_inform_them = {
		431647,
		104,
		true
	},
	towerclimbing_book_tip = {
		431751,
		125,
		true
	},
	towerclimbing_reward_tip = {
		431876,
		124,
		true
	},
	open_backyard_theme_template_tip = {
		432000,
		123,
		true
	},
	backyard_theme_cancel_template_upload_tip = {
		432123,
		193,
		true
	},
	backyard_theme_delete_themplate_tip = {
		432316,
		178,
		true
	},
	backyard_theme_template_be_delete_tip = {
		432494,
		122,
		true
	},
	backyard_theme_template_collection_cnt_max = {
		432616,
		134,
		true
	},
	backyard_theme_template_collection_cnt = {
		432750,
		120,
		true
	},
	words_visit_backyard_toggle = {
		432870,
		115,
		true
	},
	words_show_friend_backyardship_toggle = {
		432985,
		125,
		true
	},
	words_show_my_backyardship_toggle = {
		433110,
		121,
		true
	},
	option_desc7 = {
		433231,
		134,
		true
	},
	option_desc8 = {
		433365,
		173,
		true
	},
	option_desc9 = {
		433538,
		167,
		true
	},
	backyard_unopen = {
		433705,
		94,
		true
	},
	coupon_timeout_tip = {
		433799,
		138,
		true
	},
	coupon_repeat_tip = {
		433937,
		143,
		true
	},
	backyard_shop_refresh_frequently = {
		434080,
		141,
		true
	},
	word_random = {
		434221,
		81,
		true
	},
	word_hot = {
		434302,
		78,
		true
	},
	word_new = {
		434380,
		78,
		true
	},
	backyard_decoration_theme_template_delete_tip = {
		434458,
		188,
		true
	},
	backyard_not_found_theme_template = {
		434646,
		121,
		true
	},
	backyard_apply_theme_template_erro = {
		434767,
		110,
		true
	},
	backyard_theme_template_list_is_empty = {
		434877,
		128,
		true
	},
	BackYard_collection_be_delete_tip = {
		435005,
		152,
		true
	},
	backyard_theme_template_shop_tip = {
		435157,
		1110,
		true
	},
	backyard_shop_reach_last_page = {
		436267,
		133,
		true
	},
	help_monopoly_car = {
		436400,
		992,
		true
	},
	help_monopoly_car_2 = {
		437392,
		1177,
		true
	},
	help_monopoly_3th = {
		438569,
		1707,
		true
	},
	backYard_missing_furnitrue_tip = {
		440276,
		112,
		true
	},
	win_condition_display_qijian = {
		440388,
		110,
		true
	},
	win_condition_display_qijian_tip = {
		440498,
		127,
		true
	},
	win_condition_display_shangchuan = {
		440625,
		120,
		true
	},
	win_condition_display_shangchuan_tip = {
		440745,
		137,
		true
	},
	win_condition_display_judian = {
		440882,
		116,
		true
	},
	win_condition_display_tuoli = {
		440998,
		118,
		true
	},
	win_condition_display_tuoli_tip = {
		441116,
		138,
		true
	},
	lose_condition_display_quanmie = {
		441254,
		112,
		true
	},
	lose_condition_display_gangqu = {
		441366,
		132,
		true
	},
	re_battle = {
		441498,
		85,
		true
	},
	keep_fate_tip = {
		441583,
		131,
		true
	},
	equip_info_1 = {
		441714,
		82,
		true
	},
	equip_info_2 = {
		441796,
		88,
		true
	},
	equip_info_3 = {
		441884,
		82,
		true
	},
	equip_info_4 = {
		441966,
		82,
		true
	},
	equip_info_5 = {
		442048,
		82,
		true
	},
	equip_info_6 = {
		442130,
		88,
		true
	},
	equip_info_7 = {
		442218,
		88,
		true
	},
	equip_info_8 = {
		442306,
		88,
		true
	},
	equip_info_9 = {
		442394,
		88,
		true
	},
	equip_info_10 = {
		442482,
		89,
		true
	},
	equip_info_11 = {
		442571,
		89,
		true
	},
	equip_info_12 = {
		442660,
		89,
		true
	},
	equip_info_13 = {
		442749,
		83,
		true
	},
	equip_info_14 = {
		442832,
		89,
		true
	},
	equip_info_15 = {
		442921,
		89,
		true
	},
	equip_info_16 = {
		443010,
		89,
		true
	},
	equip_info_17 = {
		443099,
		89,
		true
	},
	equip_info_18 = {
		443188,
		89,
		true
	},
	equip_info_19 = {
		443277,
		89,
		true
	},
	equip_info_20 = {
		443366,
		92,
		true
	},
	equip_info_21 = {
		443458,
		92,
		true
	},
	equip_info_22 = {
		443550,
		98,
		true
	},
	equip_info_23 = {
		443648,
		89,
		true
	},
	equip_info_24 = {
		443737,
		89,
		true
	},
	equip_info_25 = {
		443826,
		80,
		true
	},
	equip_info_26 = {
		443906,
		92,
		true
	},
	equip_info_27 = {
		443998,
		77,
		true
	},
	equip_info_28 = {
		444075,
		95,
		true
	},
	equip_info_29 = {
		444170,
		95,
		true
	},
	equip_info_30 = {
		444265,
		89,
		true
	},
	equip_info_31 = {
		444354,
		83,
		true
	},
	equip_info_32 = {
		444437,
		92,
		true
	},
	equip_info_33 = {
		444529,
		95,
		true
	},
	equip_info_34 = {
		444624,
		89,
		true
	},
	equip_info_extralevel_0 = {
		444713,
		94,
		true
	},
	equip_info_extralevel_1 = {
		444807,
		94,
		true
	},
	equip_info_extralevel_2 = {
		444901,
		94,
		true
	},
	equip_info_extralevel_3 = {
		444995,
		94,
		true
	},
	tec_settings_btn_word = {
		445089,
		97,
		true
	},
	tec_tendency_x = {
		445186,
		89,
		true
	},
	tec_tendency_0 = {
		445275,
		87,
		true
	},
	tec_tendency_1 = {
		445362,
		90,
		true
	},
	tec_tendency_2 = {
		445452,
		90,
		true
	},
	tec_tendency_3 = {
		445542,
		90,
		true
	},
	tec_tendency_4 = {
		445632,
		90,
		true
	},
	tec_tendency_cur_x = {
		445722,
		102,
		true
	},
	tec_tendency_cur_0 = {
		445824,
		106,
		true
	},
	tec_tendency_cur_1 = {
		445930,
		103,
		true
	},
	tec_tendency_cur_2 = {
		446033,
		103,
		true
	},
	tec_tendency_cur_3 = {
		446136,
		103,
		true
	},
	tec_target_catchup_none = {
		446239,
		111,
		true
	},
	tec_target_catchup_selected = {
		446350,
		103,
		true
	},
	tec_tendency_cur_4 = {
		446453,
		103,
		true
	},
	tec_target_catchup_none_x = {
		446556,
		114,
		true
	},
	tec_target_catchup_none_1 = {
		446670,
		115,
		true
	},
	tec_target_catchup_none_2 = {
		446785,
		115,
		true
	},
	tec_target_catchup_none_3 = {
		446900,
		115,
		true
	},
	tec_target_catchup_selected_x = {
		447015,
		118,
		true
	},
	tec_target_catchup_selected_1 = {
		447133,
		119,
		true
	},
	tec_target_catchup_selected_2 = {
		447252,
		119,
		true
	},
	tec_target_catchup_selected_3 = {
		447371,
		119,
		true
	},
	tec_target_catchup_finish_x = {
		447490,
		116,
		true
	},
	tec_target_catchup_finish_1 = {
		447606,
		117,
		true
	},
	tec_target_catchup_finish_2 = {
		447723,
		117,
		true
	},
	tec_target_catchup_finish_3 = {
		447840,
		117,
		true
	},
	tec_target_catchup_dr_finish_tip = {
		447957,
		105,
		true
	},
	tec_target_catchup_all_finish_tip = {
		448062,
		118,
		true
	},
	tec_target_catchup_show_the_finished_version = {
		448180,
		145,
		true
	},
	tec_target_catchup_pry_char = {
		448325,
		103,
		true
	},
	tec_target_catchup_dr_char = {
		448428,
		102,
		true
	},
	tec_target_need_print = {
		448530,
		97,
		true
	},
	tec_target_catchup_progress = {
		448627,
		103,
		true
	},
	tec_target_catchup_select_tip = {
		448730,
		127,
		true
	},
	tec_target_catchup_help_tip = {
		448857,
		710,
		true
	},
	tec_speedup_title = {
		449567,
		93,
		true
	},
	tec_speedup_progress = {
		449660,
		95,
		true
	},
	tec_speedup_overflow = {
		449755,
		153,
		true
	},
	tec_speedup_help_tip = {
		449908,
		227,
		true
	},
	click_back_tip = {
		450135,
		102,
		true
	},
	tech_catchup_sentence_pauses = {
		450237,
		98,
		true
	},
	tec_act_catchup_btn_word = {
		450335,
		100,
		true
	},
	tec_catchup_errorfix = {
		450435,
		353,
		true
	},
	guild_duty_is_too_low = {
		450788,
		115,
		true
	},
	guild_trainee_duty_change_tip = {
		450903,
		123,
		true
	},
	guild_not_exist_donate_task = {
		451026,
		109,
		true
	},
	guild_week_task_state_is_wrong = {
		451135,
		124,
		true
	},
	guild_get_week_done = {
		451259,
		113,
		true
	},
	guild_public_awards = {
		451372,
		101,
		true
	},
	guild_private_awards = {
		451473,
		99,
		true
	},
	guild_task_selecte_tip = {
		451572,
		179,
		true
	},
	guild_task_accept = {
		451751,
		331,
		true
	},
	guild_commander_and_sub_op = {
		452082,
		142,
		true
	},
	["guild_donate_times_not enough"] = {
		452224,
		120,
		true
	},
	guild_donate_success = {
		452344,
		102,
		true
	},
	guild_left_donate_cnt = {
		452446,
		108,
		true
	},
	guild_donate_tip = {
		452554,
		214,
		true
	},
	guild_donate_addition_capital_tip = {
		452768,
		120,
		true
	},
	guild_donate_addition_techpoint_tip = {
		452888,
		119,
		true
	},
	guild_donate_capital_toplimit = {
		453007,
		175,
		true
	},
	guild_donate_techpoint_toplimit = {
		453182,
		174,
		true
	},
	guild_supply_no_open = {
		453356,
		108,
		true
	},
	guild_supply_award_got = {
		453464,
		110,
		true
	},
	guild_new_member_get_award_tip = {
		453574,
		152,
		true
	},
	guild_start_supply_consume_tip = {
		453726,
		260,
		true
	},
	guild_left_supply_day = {
		453986,
		96,
		true
	},
	guild_supply_help_tip = {
		454082,
		601,
		true
	},
	guild_op_only_administrator = {
		454683,
		143,
		true
	},
	guild_shop_refresh_done = {
		454826,
		99,
		true
	},
	guild_shop_cnt_no_enough = {
		454925,
		100,
		true
	},
	guild_shop_refresh_all_tip = {
		455025,
		148,
		true
	},
	guild_shop_exchange_tip = {
		455173,
		108,
		true
	},
	guild_shop_label_1 = {
		455281,
		115,
		true
	},
	guild_shop_label_2 = {
		455396,
		97,
		true
	},
	guild_shop_label_3 = {
		455493,
		89,
		true
	},
	guild_shop_label_4 = {
		455582,
		88,
		true
	},
	guild_shop_label_5 = {
		455670,
		115,
		true
	},
	guild_shop_must_select_goods = {
		455785,
		125,
		true
	},
	guild_not_exist_activation_tech = {
		455910,
		141,
		true
	},
	guild_not_exist_tech = {
		456051,
		108,
		true
	},
	guild_cancel_only_once_pre_day = {
		456159,
		137,
		true
	},
	guild_tech_is_max_level = {
		456296,
		120,
		true
	},
	guild_tech_gold_no_enough = {
		456416,
		132,
		true
	},
	guild_tech_guildgold_no_enough = {
		456548,
		140,
		true
	},
	guild_tech_upgrade_done = {
		456688,
		126,
		true
	},
	guild_exist_activation_tech = {
		456814,
		127,
		true
	},
	guild_tech_gold_desc = {
		456941,
		110,
		true
	},
	guild_tech_oil_desc = {
		457051,
		109,
		true
	},
	guild_tech_shipbag_desc = {
		457160,
		113,
		true
	},
	guild_tech_equipbag_desc = {
		457273,
		114,
		true
	},
	guild_box_gold_desc = {
		457387,
		109,
		true
	},
	guidl_r_box_time_desc = {
		457496,
		112,
		true
	},
	guidl_sr_box_time_desc = {
		457608,
		114,
		true
	},
	guidl_ssr_box_time_desc = {
		457722,
		116,
		true
	},
	guild_member_max_cnt_desc = {
		457838,
		118,
		true
	},
	guild_tech_livness_no_enough = {
		457956,
		230,
		true
	},
	guild_tech_livness_no_enough_label = {
		458186,
		124,
		true
	},
	guild_ship_attr_desc = {
		458310,
		117,
		true
	},
	guild_start_tech_group_tip = {
		458427,
		138,
		true
	},
	guild_cancel_tech_tip = {
		458565,
		227,
		true
	},
	guild_tech_consume_tip = {
		458792,
		202,
		true
	},
	guild_tech_non_admin = {
		458994,
		169,
		true
	},
	guild_tech_label_max_level = {
		459163,
		103,
		true
	},
	guild_tech_label_dev_progress = {
		459266,
		105,
		true
	},
	guild_tech_label_condition = {
		459371,
		114,
		true
	},
	guild_tech_donate_target = {
		459485,
		109,
		true
	},
	guild_not_exist = {
		459594,
		97,
		true
	},
	guild_not_exist_battle = {
		459691,
		110,
		true
	},
	guild_battle_is_end = {
		459801,
		107,
		true
	},
	guild_battle_is_exist = {
		459908,
		112,
		true
	},
	guild_guildgold_no_enough_for_battle = {
		460020,
		143,
		true
	},
	guild_event_start_tip1 = {
		460163,
		144,
		true
	},
	guild_event_start_tip2 = {
		460307,
		150,
		true
	},
	guild_word_may_happen_event = {
		460457,
		109,
		true
	},
	guild_battle_award = {
		460566,
		94,
		true
	},
	guild_word_consume = {
		460660,
		88,
		true
	},
	guild_start_event_consume_tip = {
		460748,
		146,
		true
	},
	guild_start_event_consume_tip_extra = {
		460894,
		207,
		true
	},
	guild_word_consume_for_battle = {
		461101,
		111,
		true
	},
	guild_level_no_enough = {
		461212,
		124,
		true
	},
	guild_open_event_info_when_exist_active = {
		461336,
		142,
		true
	},
	guild_join_event_cnt_label = {
		461478,
		109,
		true
	},
	guild_join_event_max_cnt_tip = {
		461587,
		132,
		true
	},
	guild_join_event_progress_label = {
		461719,
		108,
		true
	},
	guild_join_event_exist_finished_mission_tip = {
		461827,
		232,
		true
	},
	guild_event_not_exist = {
		462059,
		106,
		true
	},
	guild_fleet_can_not_edit = {
		462165,
		112,
		true
	},
	guild_fleet_exist_same_kind_ship = {
		462277,
		148,
		true
	},
	guild_event_exist_same_kind_ship = {
		462425,
		130,
		true
	},
	guidl_event_ship_in_event = {
		462555,
		138,
		true
	},
	guild_event_start_done = {
		462693,
		98,
		true
	},
	guild_fleet_update_done = {
		462791,
		105,
		true
	},
	guild_event_is_lock = {
		462896,
		98,
		true
	},
	guild_event_is_finish = {
		462994,
		158,
		true
	},
	guild_fleet_not_save_tip = {
		463152,
		138,
		true
	},
	guild_word_battle_area = {
		463290,
		99,
		true
	},
	guild_word_battle_type = {
		463389,
		99,
		true
	},
	guild_wrod_battle_target = {
		463488,
		101,
		true
	},
	guild_event_recomm_ship_failed = {
		463589,
		124,
		true
	},
	guild_event_start_event_tip = {
		463713,
		137,
		true
	},
	guild_word_sea = {
		463850,
		84,
		true
	},
	guild_word_score_addition = {
		463934,
		102,
		true
	},
	guild_word_effect_addition = {
		464036,
		103,
		true
	},
	guild_curr_fleet_can_not_edit = {
		464139,
		117,
		true
	},
	guild_next_edit_fleet_time = {
		464256,
		119,
		true
	},
	guild_event_info_desc1 = {
		464375,
		136,
		true
	},
	guild_event_info_desc2 = {
		464511,
		119,
		true
	},
	guild_join_member_cnt = {
		464630,
		98,
		true
	},
	guild_total_effect = {
		464728,
		92,
		true
	},
	guild_word_people = {
		464820,
		84,
		true
	},
	guild_event_info_desc3 = {
		464904,
		105,
		true
	},
	guild_not_exist_boss = {
		465009,
		105,
		true
	},
	guild_ship_from = {
		465114,
		86,
		true
	},
	guild_boss_formation_1 = {
		465200,
		130,
		true
	},
	guild_boss_formation_2 = {
		465330,
		130,
		true
	},
	guild_boss_formation_3 = {
		465460,
		125,
		true
	},
	guild_boss_cnt_no_enough = {
		465585,
		106,
		true
	},
	guild_boss_fleet_cnt_invaild = {
		465691,
		125,
		true
	},
	guild_boss_formation_not_exist_self_ship = {
		465816,
		166,
		true
	},
	guild_boss_formation_exist_event_ship = {
		465982,
		155,
		true
	},
	guild_fleet_is_legal = {
		466137,
		144,
		true
	},
	guild_battle_result_boss_is_death = {
		466281,
		149,
		true
	},
	guild_must_edit_fleet = {
		466430,
		109,
		true
	},
	guild_ship_in_battle = {
		466539,
		153,
		true
	},
	guild_ship_in_assult_fleet = {
		466692,
		130,
		true
	},
	guild_event_exist_assult_ship = {
		466822,
		130,
		true
	},
	guild_formation_erro_in_boss_battle = {
		466952,
		151,
		true
	},
	guild_get_report_failed = {
		467103,
		111,
		true
	},
	guild_report_get_all = {
		467214,
		96,
		true
	},
	guild_can_not_get_tip = {
		467310,
		124,
		true
	},
	guild_not_exist_notifycation = {
		467434,
		116,
		true
	},
	guild_exist_report_award_when_exit = {
		467550,
		147,
		true
	},
	guild_report_tooltip = {
		467697,
		179,
		true
	},
	word_guildgold = {
		467876,
		87,
		true
	},
	guild_member_rank_title_donate = {
		467963,
		106,
		true
	},
	guild_member_rank_title_finish_cnt = {
		468069,
		110,
		true
	},
	guild_member_rank_title_join_cnt = {
		468179,
		108,
		true
	},
	guild_donate_log = {
		468287,
		142,
		true
	},
	guild_supply_log = {
		468429,
		139,
		true
	},
	guild_weektask_log = {
		468568,
		133,
		true
	},
	guild_battle_log = {
		468701,
		134,
		true
	},
	guild_tech_change_log = {
		468835,
		119,
		true
	},
	guild_log_title = {
		468954,
		91,
		true
	},
	guild_use_donateitem_success = {
		469045,
		128,
		true
	},
	guild_use_battleitem_success = {
		469173,
		128,
		true
	},
	not_exist_guild_use_item = {
		469301,
		131,
		true
	},
	guild_member_tip = {
		469432,
		2310,
		true
	},
	guild_tech_tip = {
		471742,
		2233,
		true
	},
	guild_office_tip = {
		473975,
		2541,
		true
	},
	guild_event_help_tip = {
		476516,
		2346,
		true
	},
	guild_mission_info_tip = {
		478862,
		1309,
		true
	},
	guild_public_tech_tip = {
		480171,
		531,
		true
	},
	guild_public_office_tip = {
		480702,
		373,
		true
	},
	guild_tech_price_inc_tip = {
		481075,
		242,
		true
	},
	guild_boss_fleet_desc = {
		481317,
		458,
		true
	},
	guild_boss_formation_exist_invaild_ship = {
		481775,
		161,
		true
	},
	guild_exist_unreceived_supply_award = {
		481936,
		127,
		true
	},
	word_shipState_guild_event = {
		482063,
		139,
		true
	},
	word_shipState_guild_boss = {
		482202,
		180,
		true
	},
	commander_is_in_guild = {
		482382,
		182,
		true
	},
	guild_assult_ship_recommend = {
		482564,
		152,
		true
	},
	guild_cancel_assult_ship_recommend = {
		482716,
		159,
		true
	},
	guild_assult_ship_recommend_conflict = {
		482875,
		167,
		true
	},
	guild_recommend_limit = {
		483042,
		144,
		true
	},
	guild_cancel_assult_ship_recommend_conflict = {
		483186,
		183,
		true
	},
	guild_mission_complate = {
		483369,
		112,
		true
	},
	guild_operation_event_occurrence = {
		483481,
		160,
		true
	},
	guild_transfer_president_confirm = {
		483641,
		201,
		true
	},
	guild_damage_ranking = {
		483842,
		90,
		true
	},
	guild_total_damage = {
		483932,
		91,
		true
	},
	guild_donate_list_updated = {
		484023,
		116,
		true
	},
	guild_donate_list_update_failed = {
		484139,
		125,
		true
	},
	guild_tip_quit_operation = {
		484264,
		244,
		true
	},
	guild_tip_grand_fleet_is_frozen = {
		484508,
		141,
		true
	},
	guild_tip_operation_time_is_not_ample = {
		484649,
		236,
		true
	},
	guild_time_remaining_tip = {
		484885,
		107,
		true
	},
	help_rollingBallGame = {
		484992,
		1086,
		true
	},
	rolling_ball_help = {
		486078,
		691,
		true
	},
	help_jiujiu_expedition_game = {
		486769,
		609,
		true
	},
	jiujiu_expedition_game_stg_desc = {
		487378,
		112,
		true
	},
	build_ship_accumulative = {
		487490,
		100,
		true
	},
	destory_ship_before_tip = {
		487590,
		99,
		true
	},
	destory_ship_input_erro = {
		487689,
		133,
		true
	},
	destroy_ur_rarity_tip = {
		487822,
		182,
		true
	},
	destory_ur_pt_overflowa = {
		488004,
		231,
		true
	},
	jiujiu_expedition_help = {
		488235,
		561,
		true
	},
	shop_label_unlimt_cnt = {
		488796,
		100,
		true
	},
	jiujiu_expedition_book_tip = {
		488896,
		130,
		true
	},
	jiujiu_expedition_reward_tip = {
		489026,
		128,
		true
	},
	jiujiu_expedition_amount_tip = {
		489154,
		147,
		true
	},
	jiujiu_expedition_stg_tip = {
		489301,
		128,
		true
	},
	trade_card_tips1 = {
		489429,
		92,
		true
	},
	trade_card_tips2 = {
		489521,
		327,
		true
	},
	trade_card_tips3 = {
		489848,
		324,
		true
	},
	trade_card_tips4 = {
		490172,
		95,
		true
	},
	ur_exchange_help_tip = {
		490267,
		771,
		true
	},
	fleet_antisub_range = {
		491038,
		95,
		true
	},
	fleet_antisub_range_tip = {
		491133,
		1424,
		true
	},
	practise_idol_tip = {
		492557,
		107,
		true
	},
	practise_idol_help = {
		492664,
		937,
		true
	},
	upgrade_idol_tip = {
		493601,
		113,
		true
	},
	upgrade_complete_tip = {
		493714,
		99,
		true
	},
	upgrade_introduce_tip = {
		493813,
		123,
		true
	},
	collect_idol_tip = {
		493936,
		122,
		true
	},
	hand_account_tip = {
		494058,
		107,
		true
	},
	hand_account_resetting_tip = {
		494165,
		117,
		true
	},
	help_candymagic = {
		494282,
		961,
		true
	},
	award_overflow_tip = {
		495243,
		140,
		true
	},
	hunter_npc = {
		495383,
		901,
		true
	},
	fighterplane_help = {
		496284,
		931,
		true
	},
	fighterplane_J10_tip = {
		497215,
		276,
		true
	},
	fighterplane_J15_tip = {
		497491,
		513,
		true
	},
	fighterplane_FC1_tip = {
		498004,
		457,
		true
	},
	fighterplane_FC31_tip = {
		498461,
		378,
		true
	},
	fighterplane_complete_tip = {
		498839,
		204,
		true
	},
	fighterplane_destroy_tip = {
		499043,
		102,
		true
	},
	fighterplane_hit_tip = {
		499145,
		101,
		true
	},
	fighterplane_score_tip = {
		499246,
		92,
		true
	},
	venusvolleyball_help = {
		499338,
		1100,
		true
	},
	venusvolleyball_rule_tip = {
		500438,
		99,
		true
	},
	venusvolleyball_return_tip = {
		500537,
		111,
		true
	},
	venusvolleyball_suspend_tip = {
		500648,
		112,
		true
	},
	doa_main = {
		500760,
		1227,
		true
	},
	doa_pt_help = {
		501987,
		818,
		true
	},
	doa_pt_complete = {
		502805,
		94,
		true
	},
	doa_pt_up = {
		502899,
		97,
		true
	},
	doa_liliang = {
		502996,
		81,
		true
	},
	doa_jiqiao = {
		503077,
		80,
		true
	},
	doa_tili = {
		503157,
		78,
		true
	},
	doa_meili = {
		503235,
		79,
		true
	},
	snowball_help = {
		503314,
		1488,
		true
	},
	help_xinnian2021_feast = {
		504802,
		500,
		true
	},
	help_xinnian2021__qiaozhong = {
		505302,
		1153,
		true
	},
	help_xinnian2021__meishiyemian = {
		506455,
		687,
		true
	},
	help_xinnian2021__meishi = {
		507142,
		1222,
		true
	},
	help_act_event = {
		508364,
		286,
		true
	},
	autofight = {
		508650,
		85,
		true
	},
	autofight_errors_tip = {
		508735,
		139,
		true
	},
	autofight_special_operation_tip = {
		508874,
		358,
		true
	},
	autofight_formation = {
		509232,
		89,
		true
	},
	autofight_cat = {
		509321,
		86,
		true
	},
	autofight_function = {
		509407,
		88,
		true
	},
	autofight_function1 = {
		509495,
		95,
		true
	},
	autofight_function2 = {
		509590,
		95,
		true
	},
	autofight_function3 = {
		509685,
		95,
		true
	},
	autofight_function4 = {
		509780,
		89,
		true
	},
	autofight_function5 = {
		509869,
		101,
		true
	},
	autofight_rewards = {
		509970,
		99,
		true
	},
	autofight_rewards_none = {
		510069,
		113,
		true
	},
	autofight_leave = {
		510182,
		85,
		true
	},
	autofight_onceagain = {
		510267,
		95,
		true
	},
	autofight_entrust = {
		510362,
		116,
		true
	},
	autofight_task = {
		510478,
		107,
		true
	},
	autofight_effect = {
		510585,
		131,
		true
	},
	autofight_file = {
		510716,
		110,
		true
	},
	autofight_discovery = {
		510826,
		124,
		true
	},
	autofight_tip_bigworld_dead = {
		510950,
		140,
		true
	},
	autofight_tip_bigworld_begin = {
		511090,
		128,
		true
	},
	autofight_tip_bigworld_stop = {
		511218,
		127,
		true
	},
	autofight_tip_bigworld_suspend = {
		511345,
		167,
		true
	},
	autofight_tip_bigworld_loop = {
		511512,
		143,
		true
	},
	autofight_farm = {
		511655,
		90,
		true
	},
	autofight_story = {
		511745,
		118,
		true
	},
	fushun_adventure_help = {
		511863,
		1774,
		true
	},
	autofight_change_tip = {
		513637,
		165,
		true
	},
	autofight_selectprops_tip = {
		513802,
		114,
		true
	},
	help_chunjie2021_feast = {
		513916,
		759,
		true
	},
	valentinesday__txt1_tip = {
		514675,
		157,
		true
	},
	valentinesday__txt2_tip = {
		514832,
		157,
		true
	},
	valentinesday__txt3_tip = {
		514989,
		145,
		true
	},
	valentinesday__txt4_tip = {
		515134,
		145,
		true
	},
	valentinesday__txt5_tip = {
		515279,
		163,
		true
	},
	valentinesday__txt6_tip = {
		515442,
		151,
		true
	},
	valentinesday__shop_tip = {
		515593,
		120,
		true
	},
	wwf_bamboo_tip1 = {
		515713,
		109,
		true
	},
	wwf_bamboo_tip2 = {
		515822,
		109,
		true
	},
	wwf_bamboo_tip3 = {
		515931,
		121,
		true
	},
	wwf_bamboo_help = {
		516052,
		760,
		true
	},
	wwf_guide_tip = {
		516812,
		152,
		true
	},
	securitycake_help = {
		516964,
		1537,
		true
	},
	icecream_help = {
		518501,
		800,
		true
	},
	icecream_make_tip = {
		519301,
		92,
		true
	},
	cadpa_help = {
		519393,
		1225,
		true
	},
	cadpa_tip1 = {
		520618,
		86,
		true
	},
	cadpa_tip2 = {
		520704,
		85,
		true
	},
	query_role = {
		520789,
		83,
		true
	},
	query_role_none = {
		520872,
		88,
		true
	},
	query_role_button = {
		520960,
		93,
		true
	},
	query_role_fail = {
		521053,
		91,
		true
	},
	cumulative_victory_target_tip = {
		521144,
		114,
		true
	},
	cumulative_victory_now_tip = {
		521258,
		111,
		true
	},
	word_files_repair = {
		521369,
		93,
		true
	},
	repair_setting_label = {
		521462,
		96,
		true
	},
	voice_control = {
		521558,
		83,
		true
	},
	index_equip = {
		521641,
		84,
		true
	},
	index_without_limit = {
		521725,
		92,
		true
	},
	meta_learn_skill = {
		521817,
		108,
		true
	},
	world_joint_boss_not_found = {
		521925,
		139,
		true
	},
	world_joint_boss_is_death = {
		522064,
		138,
		true
	},
	world_joint_whitout_guild = {
		522202,
		116,
		true
	},
	world_joint_whitout_friend = {
		522318,
		114,
		true
	},
	world_joint_call_support_failed = {
		522432,
		116,
		true
	},
	world_joint_call_support_success = {
		522548,
		117,
		true
	},
	world_joint_call_friend_support_txt = {
		522665,
		163,
		true
	},
	world_joint_call_guild_support_txt = {
		522828,
		171,
		true
	},
	world_joint_call_world_support_txt = {
		522999,
		165,
		true
	},
	ad_4 = {
		523164,
		211,
		true
	},
	world_word_expired = {
		523375,
		97,
		true
	},
	world_word_guild_member = {
		523472,
		113,
		true
	},
	world_word_guild_player = {
		523585,
		104,
		true
	},
	world_joint_boss_award_expired = {
		523689,
		112,
		true
	},
	world_joint_not_refresh_frequently = {
		523801,
		116,
		true
	},
	world_joint_exit_battle_tip = {
		523917,
		140,
		true
	},
	world_boss_get_item = {
		524057,
		171,
		true
	},
	world_boss_ask_help = {
		524228,
		119,
		true
	},
	world_joint_count_no_enough = {
		524347,
		115,
		true
	},
	world_boss_none = {
		524462,
		146,
		true
	},
	world_boss_fleet = {
		524608,
		92,
		true
	},
	world_max_challenge_cnt = {
		524700,
		145,
		true
	},
	world_reset_success = {
		524845,
		104,
		true
	},
	world_map_dangerous_confirm = {
		524949,
		183,
		true
	},
	world_map_version = {
		525132,
		120,
		true
	},
	world_resource_fill = {
		525252,
		128,
		true
	},
	meta_sys_lock_tip = {
		525380,
		160,
		true
	},
	meta_story_lock = {
		525540,
		139,
		true
	},
	meta_acttime_limit = {
		525679,
		88,
		true
	},
	meta_pt_left = {
		525767,
		87,
		true
	},
	meta_syn_rate = {
		525854,
		92,
		true
	},
	meta_repair_rate = {
		525946,
		95,
		true
	},
	meta_story_tip_1 = {
		526041,
		103,
		true
	},
	meta_story_tip_2 = {
		526144,
		100,
		true
	},
	meta_pt_get_way = {
		526244,
		130,
		true
	},
	meta_pt_point = {
		526374,
		86,
		true
	},
	meta_award_get = {
		526460,
		87,
		true
	},
	meta_award_got = {
		526547,
		87,
		true
	},
	meta_repair = {
		526634,
		88,
		true
	},
	meta_repair_success = {
		526722,
		101,
		true
	},
	meta_repair_effect_unlock = {
		526823,
		110,
		true
	},
	meta_repair_effect_special = {
		526933,
		130,
		true
	},
	meta_energy_ship_level_need = {
		527063,
		116,
		true
	},
	meta_energy_ship_repairrate_need = {
		527179,
		124,
		true
	},
	meta_energy_active_box_tip = {
		527303,
		165,
		true
	},
	meta_break = {
		527468,
		108,
		true
	},
	meta_energy_preview_title = {
		527576,
		119,
		true
	},
	meta_energy_preview_tip = {
		527695,
		131,
		true
	},
	meta_exp_per_day = {
		527826,
		92,
		true
	},
	meta_skill_unlock = {
		527918,
		117,
		true
	},
	meta_unlock_skill_tip = {
		528035,
		155,
		true
	},
	meta_unlock_skill_select = {
		528190,
		123,
		true
	},
	meta_switch_skill_disable = {
		528313,
		139,
		true
	},
	meta_switch_skill_box_title = {
		528452,
		124,
		true
	},
	meta_cur_pt = {
		528576,
		90,
		true
	},
	meta_toast_fullexp = {
		528666,
		106,
		true
	},
	meta_toast_tactics = {
		528772,
		91,
		true
	},
	meta_skillbtn_tactics = {
		528863,
		92,
		true
	},
	meta_destroy_tip = {
		528955,
		105,
		true
	},
	meta_voice_name_feeling1 = {
		529060,
		94,
		true
	},
	meta_voice_name_feeling2 = {
		529154,
		94,
		true
	},
	meta_voice_name_feeling3 = {
		529248,
		94,
		true
	},
	meta_voice_name_feeling4 = {
		529342,
		94,
		true
	},
	meta_voice_name_feeling5 = {
		529436,
		94,
		true
	},
	meta_voice_name_propose = {
		529530,
		93,
		true
	},
	world_boss_ad = {
		529623,
		88,
		true
	},
	world_boss_drop_title = {
		529711,
		108,
		true
	},
	world_boss_pt_recove_desc = {
		529819,
		122,
		true
	},
	world_boss_progress_item_desc = {
		529941,
		373,
		true
	},
	world_joint_max_challenge_people_cnt = {
		530314,
		143,
		true
	},
	equip_ammo_type_1 = {
		530457,
		90,
		true
	},
	equip_ammo_type_2 = {
		530547,
		90,
		true
	},
	equip_ammo_type_3 = {
		530637,
		90,
		true
	},
	equip_ammo_type_4 = {
		530727,
		87,
		true
	},
	equip_ammo_type_5 = {
		530814,
		87,
		true
	},
	equip_ammo_type_6 = {
		530901,
		90,
		true
	},
	equip_ammo_type_7 = {
		530991,
		93,
		true
	},
	equip_ammo_type_8 = {
		531084,
		90,
		true
	},
	equip_ammo_type_9 = {
		531174,
		90,
		true
	},
	equip_ammo_type_10 = {
		531264,
		85,
		true
	},
	equip_ammo_type_11 = {
		531349,
		88,
		true
	},
	common_daily_limit = {
		531437,
		105,
		true
	},
	meta_help = {
		531542,
		2341,
		true
	},
	world_boss_daily_limit = {
		533883,
		104,
		true
	},
	common_go_to_analyze = {
		533987,
		96,
		true
	},
	world_boss_not_reach_target = {
		534083,
		115,
		true
	},
	special_transform_limit_reach = {
		534198,
		163,
		true
	},
	meta_pt_notenough = {
		534361,
		180,
		true
	},
	meta_boss_unlock = {
		534541,
		182,
		true
	},
	word_take_effect = {
		534723,
		86,
		true
	},
	world_boss_challenge_cnt = {
		534809,
		100,
		true
	},
	word_shipNation_meta = {
		534909,
		87,
		true
	},
	world_word_friend = {
		534996,
		87,
		true
	},
	world_word_world = {
		535083,
		86,
		true
	},
	world_word_guild = {
		535169,
		89,
		true
	},
	world_collection_1 = {
		535258,
		94,
		true
	},
	world_collection_2 = {
		535352,
		88,
		true
	},
	world_collection_3 = {
		535440,
		91,
		true
	},
	zero_hour_command_error = {
		535531,
		111,
		true
	},
	commander_is_in_bigworld = {
		535642,
		118,
		true
	},
	world_collection_back = {
		535760,
		106,
		true
	},
	archives_whether_to_retreat = {
		535866,
		168,
		true
	},
	world_fleet_stop = {
		536034,
		104,
		true
	},
	world_setting_title = {
		536138,
		101,
		true
	},
	world_setting_quickmode = {
		536239,
		101,
		true
	},
	world_setting_quickmodetip = {
		536340,
		144,
		true
	},
	world_setting_submititem = {
		536484,
		115,
		true
	},
	world_setting_submititemtip = {
		536599,
		158,
		true
	},
	world_setting_mapauto = {
		536757,
		115,
		true
	},
	world_setting_mapautotip = {
		536872,
		158,
		true
	},
	world_boss_maintenance = {
		537030,
		139,
		true
	},
	world_boss_inbattle = {
		537169,
		119,
		true
	},
	world_automode_title_1 = {
		537288,
		104,
		true
	},
	world_automode_title_2 = {
		537392,
		95,
		true
	},
	world_automode_treasure_1 = {
		537487,
		132,
		true
	},
	world_automode_treasure_2 = {
		537619,
		132,
		true
	},
	world_automode_treasure_3 = {
		537751,
		128,
		true
	},
	world_automode_cancel = {
		537879,
		91,
		true
	},
	world_automode_confirm = {
		537970,
		92,
		true
	},
	world_automode_start_tip1 = {
		538062,
		119,
		true
	},
	world_automode_start_tip2 = {
		538181,
		104,
		true
	},
	world_automode_start_tip3 = {
		538285,
		122,
		true
	},
	world_automode_start_tip4 = {
		538407,
		113,
		true
	},
	world_automode_start_tip5 = {
		538520,
		144,
		true
	},
	world_automode_setting_1 = {
		538664,
		115,
		true
	},
	world_automode_setting_1_1 = {
		538779,
		100,
		true
	},
	world_automode_setting_1_2 = {
		538879,
		91,
		true
	},
	world_automode_setting_1_3 = {
		538970,
		91,
		true
	},
	world_automode_setting_1_4 = {
		539061,
		96,
		true
	},
	world_automode_setting_2 = {
		539157,
		112,
		true
	},
	world_automode_setting_2_1 = {
		539269,
		108,
		true
	},
	world_automode_setting_2_2 = {
		539377,
		111,
		true
	},
	world_automode_setting_all_1 = {
		539488,
		119,
		true
	},
	world_automode_setting_all_1_1 = {
		539607,
		97,
		true
	},
	world_automode_setting_all_1_2 = {
		539704,
		97,
		true
	},
	world_automode_setting_all_2 = {
		539801,
		116,
		true
	},
	world_automode_setting_all_2_1 = {
		539917,
		97,
		true
	},
	world_automode_setting_all_2_2 = {
		540014,
		109,
		true
	},
	world_automode_setting_all_2_3 = {
		540123,
		109,
		true
	},
	world_automode_setting_all_3 = {
		540232,
		119,
		true
	},
	world_automode_setting_all_3_1 = {
		540351,
		97,
		true
	},
	world_automode_setting_all_3_2 = {
		540448,
		97,
		true
	},
	world_automode_setting_all_4 = {
		540545,
		119,
		true
	},
	world_automode_setting_all_4_1 = {
		540664,
		97,
		true
	},
	world_automode_setting_all_4_2 = {
		540761,
		97,
		true
	},
	world_automode_setting_new_1 = {
		540858,
		119,
		true
	},
	world_automode_setting_new_1_1 = {
		540977,
		104,
		true
	},
	world_automode_setting_new_1_2 = {
		541081,
		95,
		true
	},
	world_automode_setting_new_1_3 = {
		541176,
		95,
		true
	},
	world_automode_setting_new_1_4 = {
		541271,
		95,
		true
	},
	world_automode_setting_new_1_5 = {
		541366,
		100,
		true
	},
	world_collection_task_tip_1 = {
		541466,
		152,
		true
	},
	area_putong = {
		541618,
		87,
		true
	},
	area_anquan = {
		541705,
		87,
		true
	},
	area_yaosai = {
		541792,
		87,
		true
	},
	area_yaosai_2 = {
		541879,
		107,
		true
	},
	area_shenyuan = {
		541986,
		89,
		true
	},
	area_yinmi = {
		542075,
		86,
		true
	},
	area_renwu = {
		542161,
		86,
		true
	},
	area_zhuxian = {
		542247,
		88,
		true
	},
	area_dangan = {
		542335,
		87,
		true
	},
	charge_trade_no_error = {
		542422,
		126,
		true
	},
	world_reset_1 = {
		542548,
		130,
		true
	},
	world_reset_2 = {
		542678,
		136,
		true
	},
	world_reset_3 = {
		542814,
		116,
		true
	},
	guild_is_frozen_when_start_tech = {
		542930,
		141,
		true
	},
	world_boss_unactivated = {
		543071,
		128,
		true
	},
	world_reset_tip = {
		543199,
		2572,
		true
	},
	spring_invited_2021 = {
		545771,
		217,
		true
	},
	charge_error_count_limit = {
		545988,
		149,
		true
	},
	charge_error_disable = {
		546137,
		120,
		true
	},
	levelScene_select_sp = {
		546257,
		120,
		true
	},
	word_adjustFleet = {
		546377,
		92,
		true
	},
	levelScene_select_noitem = {
		546469,
		112,
		true
	},
	story_setting_label = {
		546581,
		113,
		true
	},
	login_arrears_tips = {
		546694,
		154,
		true
	},
	Supplement_pay1 = {
		546848,
		195,
		true
	},
	Supplement_pay2 = {
		547043,
		146,
		true
	},
	Supplement_pay3 = {
		547189,
		237,
		true
	},
	Supplement_pay4 = {
		547426,
		91,
		true
	},
	world_ship_repair = {
		547517,
		114,
		true
	},
	Supplement_pay5 = {
		547631,
		143,
		true
	},
	area_unkown = {
		547774,
		87,
		true
	},
	Supplement_pay6 = {
		547861,
		94,
		true
	},
	Supplement_pay7 = {
		547955,
		94,
		true
	},
	Supplement_pay8 = {
		548049,
		88,
		true
	},
	world_battle_damage = {
		548137,
		164,
		true
	},
	setting_story_speed_1 = {
		548301,
		88,
		true
	},
	setting_story_speed_2 = {
		548389,
		91,
		true
	},
	setting_story_speed_3 = {
		548480,
		88,
		true
	},
	setting_story_speed_4 = {
		548568,
		91,
		true
	},
	story_autoplay_setting_label = {
		548659,
		110,
		true
	},
	story_autoplay_setting_1 = {
		548769,
		94,
		true
	},
	story_autoplay_setting_2 = {
		548863,
		94,
		true
	},
	meta_shop_exchange_limit = {
		548957,
		103,
		true
	},
	meta_shop_unexchange_label = {
		549060,
		108,
		true
	},
	daily_level_quick_battle_label2 = {
		549168,
		101,
		true
	},
	daily_level_quick_battle_label1 = {
		549269,
		131,
		true
	},
	dailyLevel_quickfinish = {
		549400,
		335,
		true
	},
	daily_level_quick_battle_label3 = {
		549735,
		107,
		true
	},
	backyard_longpress_ship_tip = {
		549842,
		134,
		true
	},
	common_npc_formation_tip = {
		549976,
		124,
		true
	},
	gametip_xiaotiancheng = {
		550100,
		1012,
		true
	},
	guild_task_autoaccept_1 = {
		551112,
		122,
		true
	},
	guild_task_autoaccept_2 = {
		551234,
		122,
		true
	},
	task_lock = {
		551356,
		85,
		true
	},
	week_task_pt_name = {
		551441,
		90,
		true
	},
	week_task_award_preview_label = {
		551531,
		105,
		true
	},
	week_task_title_label = {
		551636,
		103,
		true
	},
	cattery_op_clean_success = {
		551739,
		100,
		true
	},
	cattery_op_feed_success = {
		551839,
		99,
		true
	},
	cattery_op_play_success = {
		551938,
		99,
		true
	},
	cattery_style_change_success = {
		552037,
		104,
		true
	},
	cattery_add_commander_success = {
		552141,
		114,
		true
	},
	cattery_remove_commander_success = {
		552255,
		117,
		true
	},
	commander_box_quickly_tool_tip_1 = {
		552372,
		136,
		true
	},
	commander_box_quickly_tool_tip_2 = {
		552508,
		132,
		true
	},
	commander_box_quickly_tool_tip_3 = {
		552640,
		111,
		true
	},
	commander_box_was_finished = {
		552751,
		114,
		true
	},
	comander_tool_cnt_is_reclac = {
		552865,
		118,
		true
	},
	comander_tool_max_cnt = {
		552983,
		105,
		true
	},
	cat_home_help = {
		553088,
		925,
		true
	},
	cat_accelfrate_notenough = {
		554013,
		124,
		true
	},
	cat_home_unlock = {
		554137,
		121,
		true
	},
	cat_sleep_notplay = {
		554258,
		126,
		true
	},
	cathome_style_unlock = {
		554384,
		126,
		true
	},
	commander_is_in_cattery = {
		554510,
		120,
		true
	},
	cat_home_interaction = {
		554630,
		110,
		true
	},
	cat_accelerate_left = {
		554740,
		101,
		true
	},
	common_clean = {
		554841,
		82,
		true
	},
	common_feed = {
		554923,
		81,
		true
	},
	common_play = {
		555004,
		81,
		true
	},
	game_stopwords = {
		555085,
		105,
		true
	},
	game_openwords = {
		555190,
		105,
		true
	},
	amusementpark_shop_enter = {
		555295,
		149,
		true
	},
	amusementpark_shop_exchange = {
		555444,
		189,
		true
	},
	amusementpark_shop_success = {
		555633,
		105,
		true
	},
	amusementpark_shop_special = {
		555738,
		143,
		true
	},
	amusementpark_shop_end = {
		555881,
		138,
		true
	},
	amusementpark_shop_0 = {
		556019,
		139,
		true
	},
	amusementpark_shop_carousel1 = {
		556158,
		159,
		true
	},
	amusementpark_shop_carousel2 = {
		556317,
		159,
		true
	},
	amusementpark_shop_carousel3 = {
		556476,
		139,
		true
	},
	amusementpark_shop_exchange2 = {
		556615,
		180,
		true
	},
	amusementpark_help = {
		556795,
		1043,
		true
	},
	amusementpark_shop_help = {
		557838,
		608,
		true
	},
	handshake_game_help = {
		558446,
		966,
		true
	},
	MeixiV4_help = {
		559412,
		792,
		true
	},
	activity_permanent_total = {
		560204,
		100,
		true
	},
	word_investigate = {
		560304,
		86,
		true
	},
	ambush_display_none = {
		560390,
		86,
		true
	},
	activity_permanent_help = {
		560476,
		386,
		true
	},
	activity_permanent_tips1 = {
		560862,
		157,
		true
	},
	activity_permanent_tips2 = {
		561019,
		164,
		true
	},
	activity_permanent_tips3 = {
		561183,
		146,
		true
	},
	activity_permanent_tips4 = {
		561329,
		214,
		true
	},
	activity_permanent_finished = {
		561543,
		100,
		true
	},
	idolmaster_main = {
		561643,
		1095,
		true
	},
	idolmaster_game_tip1 = {
		562738,
		103,
		true
	},
	idolmaster_game_tip2 = {
		562841,
		103,
		true
	},
	idolmaster_game_tip3 = {
		562944,
		98,
		true
	},
	idolmaster_game_tip4 = {
		563042,
		98,
		true
	},
	idolmaster_game_tip5 = {
		563140,
		92,
		true
	},
	idolmaster_collection = {
		563232,
		539,
		true
	},
	idolmaster_voice_name_feeling1 = {
		563771,
		100,
		true
	},
	idolmaster_voice_name_feeling2 = {
		563871,
		100,
		true
	},
	idolmaster_voice_name_feeling3 = {
		563971,
		100,
		true
	},
	idolmaster_voice_name_feeling4 = {
		564071,
		100,
		true
	},
	idolmaster_voice_name_feeling5 = {
		564171,
		100,
		true
	},
	idolmaster_voice_name_propose = {
		564271,
		99,
		true
	},
	cartoon_notall = {
		564370,
		84,
		true
	},
	cartoon_haveno = {
		564454,
		105,
		true
	},
	res_cartoon_new_tip = {
		564559,
		115,
		true
	},
	memory_actiivty_ex = {
		564674,
		86,
		true
	},
	memory_activity_sp = {
		564760,
		86,
		true
	},
	memory_activity_daily = {
		564846,
		91,
		true
	},
	memory_activity_others = {
		564937,
		92,
		true
	},
	battle_end_title = {
		565029,
		92,
		true
	},
	battle_end_subtitle1 = {
		565121,
		96,
		true
	},
	battle_end_subtitle2 = {
		565217,
		96,
		true
	},
	meta_skill_dailyexp = {
		565313,
		104,
		true
	},
	meta_skill_learn = {
		565417,
		119,
		true
	},
	meta_skill_maxtip = {
		565536,
		153,
		true
	},
	meta_tactics_detail = {
		565689,
		95,
		true
	},
	meta_tactics_unlock = {
		565784,
		95,
		true
	},
	meta_tactics_switch = {
		565879,
		95,
		true
	},
	meta_skill_maxtip2 = {
		565974,
		100,
		true
	},
	activity_permanent_progress = {
		566074,
		100,
		true
	},
	cattery_settlement_dialogue_1 = {
		566174,
		111,
		true
	},
	cattery_settlement_dialogue_2 = {
		566285,
		134,
		true
	},
	cattery_settlement_dialogue_3 = {
		566419,
		102,
		true
	},
	cattery_settlement_dialogue_4 = {
		566521,
		106,
		true
	},
	blueprint_catchup_by_gold_confirm = {
		566627,
		154,
		true
	},
	blueprint_catchup_by_gold_help = {
		566781,
		318,
		true
	},
	tec_tip_no_consumption = {
		567099,
		95,
		true
	},
	tec_tip_material_stock = {
		567194,
		92,
		true
	},
	tec_tip_to_consumption = {
		567286,
		98,
		true
	},
	onebutton_max_tip = {
		567384,
		90,
		true
	},
	target_get_tip = {
		567474,
		84,
		true
	},
	fleet_select_title = {
		567558,
		94,
		true
	},
	backyard_rename_title = {
		567652,
		97,
		true
	},
	backyard_rename_tip = {
		567749,
		101,
		true
	},
	equip_add = {
		567850,
		99,
		true
	},
	equipskin_add = {
		567949,
		109,
		true
	},
	equipskin_none = {
		568058,
		113,
		true
	},
	equipskin_typewrong = {
		568171,
		121,
		true
	},
	equipskin_typewrong_en = {
		568292,
		107,
		true
	},
	user_is_banned = {
		568399,
		121,
		true
	},
	user_is_forever_banned = {
		568520,
		104,
		true
	},
	old_class_is_close = {
		568624,
		134,
		true
	},
	activity_event_building = {
		568758,
		1087,
		true
	},
	salvage_tips = {
		569845,
		799,
		true
	},
	tips_shakebeads = {
		570644,
		757,
		true
	},
	gem_shop_xinzhi_tip = {
		571401,
		138,
		true
	},
	cowboy_tips = {
		571539,
		747,
		true
	},
	backyard_backyardScene_Disable_Rotation = {
		572286,
		124,
		true
	},
	chazi_tips = {
		572410,
		792,
		true
	},
	catchteasure_help = {
		573202,
		700,
		true
	},
	unlock_tips = {
		573902,
		97,
		true
	},
	class_label_tran = {
		573999,
		87,
		true
	},
	class_label_gen = {
		574086,
		89,
		true
	},
	class_attr_store = {
		574175,
		92,
		true
	},
	class_attr_proficiency = {
		574267,
		101,
		true
	},
	class_attr_getproficiency = {
		574368,
		104,
		true
	},
	class_attr_costproficiency = {
		574472,
		105,
		true
	},
	class_label_upgrading = {
		574577,
		94,
		true
	},
	class_label_upgradetime = {
		574671,
		99,
		true
	},
	class_label_oilfield = {
		574770,
		96,
		true
	},
	class_label_goldfield = {
		574866,
		97,
		true
	},
	class_res_maxlevel_tip = {
		574963,
		104,
		true
	},
	ship_exp_item_title = {
		575067,
		95,
		true
	},
	ship_exp_item_label_clear = {
		575162,
		96,
		true
	},
	ship_exp_item_label_recom = {
		575258,
		96,
		true
	},
	ship_exp_item_label_confirm = {
		575354,
		98,
		true
	},
	player_expResource_mail_fullBag = {
		575452,
		180,
		true
	},
	tec_nation_award_finish = {
		575632,
		100,
		true
	},
	coures_exp_overflow_tip = {
		575732,
		155,
		true
	},
	coures_exp_npc_tip = {
		575887,
		179,
		true
	},
	coures_level_tip = {
		576066,
		160,
		true
	},
	coures_tip_material_stock = {
		576226,
		98,
		true
	},
	coures_tip_exceeded_lv = {
		576324,
		110,
		true
	},
	eatgame_tips = {
		576434,
		1055,
		true
	},
	breakout_tip_ultimatebonus_gunner = {
		577489,
		159,
		true
	},
	breakout_tip_ultimatebonus_torpedo = {
		577648,
		141,
		true
	},
	breakout_tip_ultimatebonus_aux = {
		577789,
		137,
		true
	},
	map_event_lighthouse_tip_1 = {
		577926,
		151,
		true
	},
	battlepass_main_tip_2110 = {
		578077,
		238,
		true
	},
	battlepass_main_time = {
		578315,
		94,
		true
	},
	battlepass_main_help_2110 = {
		578409,
		2927,
		true
	},
	cruise_task_help_2110 = {
		581336,
		1226,
		true
	},
	cruise_task_phase = {
		582562,
		104,
		true
	},
	cruise_task_tips = {
		582666,
		92,
		true
	},
	battlepass_task_quickfinish1 = {
		582758,
		254,
		true
	},
	battlepass_task_quickfinish2 = {
		583012,
		209,
		true
	},
	battlepass_task_quickfinish3 = {
		583221,
		110,
		true
	},
	cruise_task_unlock = {
		583331,
		119,
		true
	},
	cruise_task_week = {
		583450,
		88,
		true
	},
	battlepass_pay_timelimit = {
		583538,
		99,
		true
	},
	battlepass_pay_acquire = {
		583637,
		110,
		true
	},
	battlepass_pay_attention = {
		583747,
		134,
		true
	},
	battlepass_acquire_attention = {
		583881,
		160,
		true
	},
	battlepass_pay_tip = {
		584041,
		118,
		true
	},
	battlepass_main_tip1 = {
		584159,
		300,
		true
	},
	battlepass_main_tip2 = {
		584459,
		266,
		true
	},
	battlepass_main_tip3 = {
		584725,
		300,
		true
	},
	battlepass_complete = {
		585025,
		110,
		true
	},
	shop_free_tag = {
		585135,
		83,
		true
	},
	quick_equip_tip1 = {
		585218,
		89,
		true
	},
	quick_equip_tip2 = {
		585307,
		86,
		true
	},
	quick_equip_tip3 = {
		585393,
		86,
		true
	},
	quick_equip_tip4 = {
		585479,
		107,
		true
	},
	quick_equip_tip5 = {
		585586,
		125,
		true
	},
	quick_equip_tip6 = {
		585711,
		170,
		true
	},
	retire_importantequipment_tips = {
		585881,
		155,
		true
	},
	settle_rewards_title = {
		586036,
		102,
		true
	},
	settle_rewards_subtitle = {
		586138,
		101,
		true
	},
	total_rewards_subtitle = {
		586239,
		99,
		true
	},
	settle_rewards_text = {
		586338,
		95,
		true
	},
	use_oil_limit_help = {
		586433,
		254,
		true
	},
	formationScene_use_oil_limit_tip = {
		586687,
		117,
		true
	},
	index_awakening2 = {
		586804,
		130,
		true
	},
	index_upgrade = {
		586934,
		86,
		true
	},
	formationScene_use_oil_limit_enemy = {
		587020,
		104,
		true
	},
	formationScene_use_oil_limit_flagship = {
		587124,
		107,
		true
	},
	formationScene_use_oil_limit_submarine = {
		587231,
		108,
		true
	},
	formationScene_use_oil_limit_surface = {
		587339,
		106,
		true
	},
	formationScene_use_oil_limit_tip_worldboss = {
		587445,
		119,
		true
	},
	attr_durability = {
		587564,
		85,
		true
	},
	attr_armor = {
		587649,
		80,
		true
	},
	attr_reload = {
		587729,
		81,
		true
	},
	attr_cannon = {
		587810,
		81,
		true
	},
	attr_torpedo = {
		587891,
		82,
		true
	},
	attr_motion = {
		587973,
		81,
		true
	},
	attr_antiaircraft = {
		588054,
		87,
		true
	},
	attr_air = {
		588141,
		78,
		true
	},
	attr_hit = {
		588219,
		78,
		true
	},
	attr_antisub = {
		588297,
		82,
		true
	},
	attr_oxy_max = {
		588379,
		82,
		true
	},
	attr_ammo = {
		588461,
		82,
		true
	},
	attr_hunting_range = {
		588543,
		94,
		true
	},
	attr_luck = {
		588637,
		79,
		true
	},
	attr_consume = {
		588716,
		82,
		true
	},
	attr_speed = {
		588798,
		80,
		true
	},
	monthly_card_tip = {
		588878,
		103,
		true
	},
	shopping_error_time_limit = {
		588981,
		162,
		true
	},
	world_total_power = {
		589143,
		90,
		true
	},
	world_mileage = {
		589233,
		89,
		true
	},
	world_pressing = {
		589322,
		90,
		true
	},
	Settings_title_FPS = {
		589412,
		94,
		true
	},
	Settings_title_Notification = {
		589506,
		109,
		true
	},
	Settings_title_Other = {
		589615,
		96,
		true
	},
	Settings_title_LoginJP = {
		589711,
		95,
		true
	},
	Settings_title_Redeem = {
		589806,
		94,
		true
	},
	Settings_title_AdjustScr = {
		589900,
		103,
		true
	},
	Settings_title_Secpw = {
		590003,
		96,
		true
	},
	Settings_title_Secpwlimop = {
		590099,
		113,
		true
	},
	Settings_title_agreement = {
		590212,
		100,
		true
	},
	Settings_title_sound = {
		590312,
		96,
		true
	},
	Settings_title_resUpdate = {
		590408,
		100,
		true
	},
	equipment_info_change_tip = {
		590508,
		116,
		true
	},
	equipment_info_change_name_a = {
		590624,
		119,
		true
	},
	equipment_info_change_name_b = {
		590743,
		119,
		true
	},
	equipment_info_change_text_before = {
		590862,
		106,
		true
	},
	equipment_info_change_text_after = {
		590968,
		105,
		true
	},
	world_boss_progress_tip_title = {
		591073,
		117,
		true
	},
	world_boss_progress_tip_desc = {
		591190,
		286,
		true
	},
	ssss_main_help = {
		591476,
		1030,
		true
	},
	mini_game_time = {
		592506,
		88,
		true
	},
	mini_game_score = {
		592594,
		86,
		true
	},
	mini_game_leave = {
		592680,
		98,
		true
	},
	mini_game_pause = {
		592778,
		98,
		true
	},
	mini_game_cur_score = {
		592876,
		96,
		true
	},
	mini_game_high_score = {
		592972,
		97,
		true
	},
	monopoly_world_tip1 = {
		593069,
		104,
		true
	},
	monopoly_world_tip2 = {
		593173,
		213,
		true
	},
	monopoly_world_tip3 = {
		593386,
		183,
		true
	},
	help_monopoly_world = {
		593569,
		1446,
		true
	},
	ssssmedal_tip = {
		595015,
		185,
		true
	},
	ssssmedal_name = {
		595200,
		110,
		true
	},
	ssssmedal_belonging = {
		595310,
		115,
		true
	},
	ssssmedal_name1 = {
		595425,
		107,
		true
	},
	ssssmedal_name2 = {
		595532,
		107,
		true
	},
	ssssmedal_name3 = {
		595639,
		107,
		true
	},
	ssssmedal_name4 = {
		595746,
		107,
		true
	},
	ssssmedal_name5 = {
		595853,
		107,
		true
	},
	ssssmedal_name6 = {
		595960,
		88,
		true
	},
	ssssmedal_belonging1 = {
		596048,
		106,
		true
	},
	ssssmedal_belonging2 = {
		596154,
		106,
		true
	},
	ssssmedal_desc1 = {
		596260,
		161,
		true
	},
	ssssmedal_desc2 = {
		596421,
		173,
		true
	},
	ssssmedal_desc3 = {
		596594,
		179,
		true
	},
	ssssmedal_desc4 = {
		596773,
		182,
		true
	},
	ssssmedal_desc5 = {
		596955,
		185,
		true
	},
	ssssmedal_desc6 = {
		597140,
		155,
		true
	},
	show_fate_demand_count = {
		597295,
		140,
		true
	},
	show_design_demand_count = {
		597435,
		144,
		true
	},
	blueprint_select_overflow = {
		597579,
		107,
		true
	},
	blueprint_select_overflow_tip = {
		597686,
		175,
		true
	},
	blueprint_exchange_empty_tip = {
		597861,
		125,
		true
	},
	blueprint_exchange_select_display = {
		597986,
		124,
		true
	},
	build_rate_title = {
		598110,
		92,
		true
	},
	build_pools_intro = {
		598202,
		136,
		true
	},
	build_detail_intro = {
		598338,
		118,
		true
	},
	ssss_game_tip = {
		598456,
		2399,
		true
	},
	ssss_medal_tip = {
		600855,
		557,
		true
	},
	battlepass_main_tip_2112 = {
		601412,
		237,
		true
	},
	battlepass_main_help_2112 = {
		601649,
		2927,
		true
	},
	cruise_task_help_2112 = {
		604576,
		1225,
		true
	},
	littleSanDiego_npc = {
		605801,
		1044,
		true
	},
	tag_ship_unlocked = {
		606845,
		96,
		true
	},
	tag_ship_locked = {
		606941,
		94,
		true
	},
	acceleration_tips_1 = {
		607035,
		191,
		true
	},
	acceleration_tips_2 = {
		607226,
		197,
		true
	},
	noacceleration_tips = {
		607423,
		122,
		true
	},
	word_shipskin = {
		607545,
		83,
		true
	},
	settings_sound_title_bgm = {
		607628,
		101,
		true
	},
	settings_sound_title_effct = {
		607729,
		103,
		true
	},
	settings_sound_title_cv = {
		607832,
		100,
		true
	},
	setting_resdownload_title_gallery = {
		607932,
		115,
		true
	},
	setting_resdownload_title_live2d = {
		608047,
		114,
		true
	},
	setting_resdownload_title_music = {
		608161,
		113,
		true
	},
	setting_resdownload_title_sound = {
		608274,
		116,
		true
	},
	setting_resdownload_title_manga = {
		608390,
		113,
		true
	},
	setting_resdownload_title_dorm = {
		608503,
		112,
		true
	},
	setting_resdownload_title_main_group = {
		608615,
		118,
		true
	},
	settings_battle_title = {
		608733,
		97,
		true
	},
	settings_battle_tip = {
		608830,
		114,
		true
	},
	settings_battle_Btn_edit = {
		608944,
		95,
		true
	},
	settings_battle_Btn_reset = {
		609039,
		96,
		true
	},
	settings_battle_Btn_save = {
		609135,
		95,
		true
	},
	settings_battle_Btn_cancel = {
		609230,
		97,
		true
	},
	settings_pwd_label_close = {
		609327,
		94,
		true
	},
	settings_pwd_label_open = {
		609421,
		93,
		true
	},
	word_frame = {
		609514,
		77,
		true
	},
	Settings_title_Redeem_input_label = {
		609591,
		113,
		true
	},
	Settings_title_Redeem_input_submit = {
		609704,
		105,
		true
	},
	Settings_title_Redeem_input_placeholder = {
		609809,
		127,
		true
	},
	CurlingGame_tips1 = {
		609936,
		937,
		true
	},
	maid_task_tips1 = {
		610873,
		584,
		true
	},
	shop_diamond_title = {
		611457,
		94,
		true
	},
	shop_gift_title = {
		611551,
		91,
		true
	},
	shop_item_title = {
		611642,
		91,
		true
	},
	shop_charge_level_limit = {
		611733,
		96,
		true
	},
	backhill_cantupbuilding = {
		611829,
		149,
		true
	},
	pray_cant_tips = {
		611978,
		139,
		true
	},
	help_xinnian2022_feast = {
		612117,
		688,
		true
	},
	Pray_activity_tips1 = {
		612805,
		1325,
		true
	},
	backhill_notenoughbuilding = {
		614130,
		219,
		true
	},
	help_xinnian2022_z28 = {
		614349,
		690,
		true
	},
	help_xinnian2022_firework = {
		615039,
		1229,
		true
	},
	player_manifesto_placeholder = {
		616268,
		113,
		true
	},
	box_ship_del_click = {
		616381,
		94,
		true
	},
	box_equipment_del_click = {
		616475,
		99,
		true
	},
	change_player_name_title = {
		616574,
		100,
		true
	},
	change_player_name_subtitle = {
		616674,
		106,
		true
	},
	change_player_name_input_tip = {
		616780,
		104,
		true
	},
	change_player_name_illegal = {
		616884,
		179,
		true
	},
	nodisplay_player_home_name = {
		617063,
		96,
		true
	},
	nodisplay_player_home_share = {
		617159,
		112,
		true
	},
	tactics_class_start = {
		617271,
		95,
		true
	},
	tactics_class_cancel = {
		617366,
		90,
		true
	},
	tactics_class_get_exp = {
		617456,
		103,
		true
	},
	tactics_class_spend_time = {
		617559,
		100,
		true
	},
	build_ticket_description = {
		617659,
		112,
		true
	},
	build_ticket_expire_warning = {
		617771,
		107,
		true
	},
	tip_build_ticket_expired = {
		617878,
		130,
		true
	},
	tip_build_ticket_exchange_expired = {
		618008,
		142,
		true
	},
	tip_build_ticket_not_enough = {
		618150,
		111,
		true
	},
	build_ship_tip_use_ticket = {
		618261,
		177,
		true
	},
	springfes_tips1 = {
		618438,
		914,
		true
	},
	worldinpicture_tavel_point_tip = {
		619352,
		112,
		true
	},
	worldinpicture_draw_point_tip = {
		619464,
		111,
		true
	},
	worldinpicture_help = {
		619575,
		661,
		true
	},
	worldinpicture_task_help = {
		620236,
		666,
		true
	},
	worldinpicture_not_area_can_draw = {
		620902,
		123,
		true
	},
	missile_attack_area_confirm = {
		621025,
		103,
		true
	},
	missile_attack_area_cancel = {
		621128,
		102,
		true
	},
	shipchange_alert_infleet = {
		621230,
		143,
		true
	},
	shipchange_alert_inpvp = {
		621373,
		147,
		true
	},
	shipchange_alert_inexercise = {
		621520,
		152,
		true
	},
	shipchange_alert_inworld = {
		621672,
		149,
		true
	},
	shipchange_alert_inguildbossevent = {
		621821,
		159,
		true
	},
	shipchange_alert_indiff = {
		621980,
		148,
		true
	},
	shipmodechange_reject_1stfleet_only = {
		622128,
		188,
		true
	},
	shipmodechange_reject_worldfleet_only = {
		622316,
		193,
		true
	},
	monopoly3thre_tip = {
		622509,
		133,
		true
	},
	fushun_game3_tip = {
		622642,
		974,
		true
	},
	battlepass_main_tip_2202 = {
		623616,
		236,
		true
	},
	battlepass_main_help_2202 = {
		623852,
		2928,
		true
	},
	cruise_task_help_2202 = {
		626780,
		1224,
		true
	},
	battlepass_main_tip_2204 = {
		628004,
		236,
		true
	},
	battlepass_main_help_2204 = {
		628240,
		2919,
		true
	},
	cruise_task_help_2204 = {
		631159,
		1224,
		true
	},
	battlepass_main_tip_2206 = {
		632383,
		242,
		true
	},
	battlepass_main_help_2206 = {
		632625,
		2931,
		true
	},
	cruise_task_help_2206 = {
		635556,
		1224,
		true
	},
	battlepass_main_tip_2208 = {
		636780,
		242,
		true
	},
	battlepass_main_help_2208 = {
		637022,
		2928,
		true
	},
	cruise_task_help_2208 = {
		639950,
		1224,
		true
	},
	battlepass_main_tip_2210 = {
		641174,
		241,
		true
	},
	battlepass_main_help_2210 = {
		641415,
		2945,
		true
	},
	cruise_task_help_2210 = {
		644360,
		1226,
		true
	},
	battlepass_main_tip_2212 = {
		645586,
		246,
		true
	},
	battlepass_main_help_2212 = {
		645832,
		2933,
		true
	},
	cruise_task_help_2212 = {
		648765,
		1225,
		true
	},
	battlepass_main_tip_2302 = {
		649990,
		245,
		true
	},
	battlepass_main_help_2302 = {
		650235,
		2928,
		true
	},
	cruise_task_help_2302 = {
		653163,
		1225,
		true
	},
	battlepass_main_tip_2304 = {
		654388,
		243,
		true
	},
	battlepass_main_help_2304 = {
		654631,
		2954,
		true
	},
	cruise_task_help_2304 = {
		657585,
		1225,
		true
	},
	battlepass_main_tip_2306 = {
		658810,
		232,
		true
	},
	battlepass_main_help_2306 = {
		659042,
		2919,
		true
	},
	cruise_task_help_2306 = {
		661961,
		1225,
		true
	},
	battlepass_main_tip_2308 = {
		663186,
		226,
		true
	},
	battlepass_main_help_2308 = {
		663412,
		2922,
		true
	},
	cruise_task_help_2308 = {
		666334,
		1225,
		true
	},
	battlepass_main_tip_2310 = {
		667559,
		237,
		true
	},
	battlepass_main_help_2310 = {
		667796,
		2942,
		true
	},
	cruise_task_help_2310 = {
		670738,
		1226,
		true
	},
	battlepass_main_tip_2312 = {
		671964,
		243,
		true
	},
	battlepass_main_help_2312 = {
		672207,
		2922,
		true
	},
	cruise_task_help_2312 = {
		675129,
		1226,
		true
	},
	battlepass_main_tip_2402 = {
		676355,
		242,
		true
	},
	battlepass_main_help_2402 = {
		676597,
		2928,
		true
	},
	cruise_task_help_2402 = {
		679525,
		1225,
		true
	},
	battlepass_main_tip_2404 = {
		680750,
		242,
		true
	},
	battlepass_main_help_2404 = {
		680992,
		2925,
		true
	},
	cruise_task_help_2404 = {
		683917,
		1225,
		true
	},
	attrset_reset = {
		685142,
		89,
		true
	},
	attrset_save = {
		685231,
		88,
		true
	},
	attrset_ask_save = {
		685319,
		111,
		true
	},
	attrset_save_success = {
		685430,
		96,
		true
	},
	attrset_disable = {
		685526,
		134,
		true
	},
	attrset_input_ill = {
		685660,
		96,
		true
	},
	blackfriday_help = {
		685756,
		458,
		true
	},
	eventshop_time_hint = {
		686214,
		112,
		true
	},
	purchase_backyard_theme_desc_for_onekey = {
		686326,
		144,
		true
	},
	purchase_backyard_theme_desc_for_all = {
		686470,
		158,
		true
	},
	sp_no_quota = {
		686628,
		113,
		true
	},
	fur_all_buy = {
		686741,
		87,
		true
	},
	fur_onekey_buy = {
		686828,
		90,
		true
	},
	littleRenown_npc = {
		686918,
		1040,
		true
	},
	tech_package_tip = {
		687958,
		209,
		true
	},
	backyard_food_shop_tip = {
		688167,
		101,
		true
	},
	dorm_2f_lock = {
		688268,
		85,
		true
	},
	word_get_way = {
		688353,
		89,
		true
	},
	word_get_date = {
		688442,
		90,
		true
	},
	enter_theme_name = {
		688532,
		95,
		true
	},
	enter_extend_food_label = {
		688627,
		93,
		true
	},
	backyard_extend_tip_1 = {
		688720,
		103,
		true
	},
	backyard_extend_tip_2 = {
		688823,
		104,
		true
	},
	backyard_extend_tip_3 = {
		688927,
		109,
		true
	},
	backyard_extend_tip_4 = {
		689036,
		89,
		true
	},
	levelScene_remaster_story_tip = {
		689125,
		160,
		true
	},
	levelScene_remaster_unlock_tip = {
		689285,
		146,
		true
	},
	level_remaster_tip1 = {
		689431,
		98,
		true
	},
	level_remaster_tip2 = {
		689529,
		89,
		true
	},
	level_remaster_tip3 = {
		689618,
		89,
		true
	},
	level_remaster_tip4 = {
		689707,
		109,
		true
	},
	newserver_time = {
		689816,
		88,
		true
	},
	newserver_soldout = {
		689904,
		96,
		true
	},
	skill_learn_tip = {
		690000,
		133,
		true
	},
	newserver_build_tip = {
		690133,
		132,
		true
	},
	build_count_tip = {
		690265,
		85,
		true
	},
	help_research_package = {
		690350,
		299,
		true
	},
	lv70_package_tip = {
		690649,
		251,
		true
	},
	tech_select_tip1 = {
		690900,
		101,
		true
	},
	tech_select_tip2 = {
		691001,
		149,
		true
	},
	tech_select_tip3 = {
		691150,
		89,
		true
	},
	tech_select_tip4 = {
		691239,
		98,
		true
	},
	tech_select_tip5 = {
		691337,
		110,
		true
	},
	techpackage_item_use = {
		691447,
		253,
		true
	},
	techpackage_item_use_1 = {
		691700,
		168,
		true
	},
	techpackage_item_use_2 = {
		691868,
		196,
		true
	},
	techpackage_item_use_confirm = {
		692064,
		147,
		true
	},
	new_server_shop_sel_goods_tip = {
		692211,
		123,
		true
	},
	new_server_shop_unopen_tip = {
		692334,
		102,
		true
	},
	newserver_activity_tip = {
		692436,
		1419,
		true
	},
	newserver_shop_timelimit = {
		693855,
		114,
		true
	},
	tech_character_get = {
		693969,
		97,
		true
	},
	package_detail_tip = {
		694066,
		94,
		true
	},
	event_ui_consume = {
		694160,
		87,
		true
	},
	event_ui_recommend = {
		694247,
		88,
		true
	},
	event_ui_start = {
		694335,
		84,
		true
	},
	event_ui_giveup = {
		694419,
		85,
		true
	},
	event_ui_finish = {
		694504,
		85,
		true
	},
	nav_tactics_sel_skill_title = {
		694589,
		103,
		true
	},
	battle_result_confirm = {
		694692,
		91,
		true
	},
	battle_result_targets = {
		694783,
		97,
		true
	},
	battle_result_continue = {
		694880,
		98,
		true
	},
	index_L2D = {
		694978,
		76,
		true
	},
	index_DBG = {
		695054,
		85,
		true
	},
	index_BG = {
		695139,
		84,
		true
	},
	index_CANTUSE = {
		695223,
		89,
		true
	},
	index_UNUSE = {
		695312,
		84,
		true
	},
	index_BGM = {
		695396,
		85,
		true
	},
	without_ship_to_wear = {
		695481,
		108,
		true
	},
	choose_ship_to_wear_this_skin = {
		695589,
		123,
		true
	},
	skinatlas_search_holder = {
		695712,
		114,
		true
	},
	skinatlas_search_result_is_empty = {
		695826,
		126,
		true
	},
	chang_ship_skin_window_title = {
		695952,
		98,
		true
	},
	world_boss_item_info = {
		696050,
		364,
		true
	},
	world_past_boss_item_info = {
		696414,
		383,
		true
	},
	world_boss_lefttime = {
		696797,
		88,
		true
	},
	world_boss_item_count_noenough = {
		696885,
		118,
		true
	},
	world_boss_item_usage_tip = {
		697003,
		144,
		true
	},
	world_boss_no_select_archives = {
		697147,
		130,
		true
	},
	world_boss_archives_item_count_noenough = {
		697277,
		127,
		true
	},
	world_boss_archives_are_clear = {
		697404,
		115,
		true
	},
	world_boss_switch_archives = {
		697519,
		187,
		true
	},
	world_boss_switch_archives_success = {
		697706,
		150,
		true
	},
	world_boss_archives_auto_battle_unopen = {
		697856,
		148,
		true
	},
	world_boss_archives_need_stop_auto_battle = {
		698004,
		148,
		true
	},
	world_boss_archives_stop_auto_battle = {
		698152,
		112,
		true
	},
	world_boss_archives_continue_auto_battle = {
		698264,
		116,
		true
	},
	world_boss_archives_auto_battle_reusle_title = {
		698380,
		126,
		true
	},
	world_boss_archives_stop_auto_battle_title = {
		698506,
		127,
		true
	},
	world_boss_archives_stop_auto_battle_tip = {
		698633,
		119,
		true
	},
	world_boss_archives_stop_auto_battle_tip1 = {
		698752,
		177,
		true
	},
	world_archives_boss_help = {
		698929,
		2774,
		true
	},
	world_archives_boss_list_help = {
		701703,
		438,
		true
	},
	archives_boss_was_opened = {
		702141,
		158,
		true
	},
	current_boss_was_opened = {
		702299,
		157,
		true
	},
	world_boss_title_auto_battle = {
		702456,
		104,
		true
	},
	world_boss_title_highest_damge = {
		702560,
		106,
		true
	},
	world_boss_title_estimation = {
		702666,
		115,
		true
	},
	world_boss_title_battle_cnt = {
		702781,
		103,
		true
	},
	world_boss_title_consume_oil_cnt = {
		702884,
		108,
		true
	},
	world_boss_title_spend_time = {
		702992,
		103,
		true
	},
	world_boss_title_total_damage = {
		703095,
		102,
		true
	},
	world_no_time_to_auto_battle = {
		703197,
		125,
		true
	},
	world_boss_current_boss_label = {
		703322,
		108,
		true
	},
	world_boss_current_boss_label1 = {
		703430,
		106,
		true
	},
	world_boss_archives_boss_tip = {
		703536,
		144,
		true
	},
	world_boss_progress_no_enough = {
		703680,
		111,
		true
	},
	world_boss_auto_battle_no_oil = {
		703791,
		120,
		true
	},
	meta_syn_value_label = {
		703911,
		99,
		true
	},
	meta_syn_finish = {
		704010,
		97,
		true
	},
	index_meta_repair = {
		704107,
		96,
		true
	},
	index_meta_tactics = {
		704203,
		97,
		true
	},
	index_meta_energy = {
		704300,
		96,
		true
	},
	tactics_continue_to_learn_other_skill = {
		704396,
		138,
		true
	},
	tactics_continue_to_learn_other_ship_skill = {
		704534,
		176,
		true
	},
	tactics_no_recent_ships = {
		704710,
		111,
		true
	},
	activity_kill = {
		704821,
		89,
		true
	},
	battle_result_dmg = {
		704910,
		87,
		true
	},
	battle_result_kill_count = {
		704997,
		94,
		true
	},
	battle_result_toggle_on = {
		705091,
		102,
		true
	},
	battle_result_toggle_off = {
		705193,
		103,
		true
	},
	battle_result_continue_battle = {
		705296,
		108,
		true
	},
	battle_result_quit_battle = {
		705404,
		104,
		true
	},
	battle_result_share_battle = {
		705508,
		105,
		true
	},
	pre_combat_team = {
		705613,
		91,
		true
	},
	pre_combat_vanguard = {
		705704,
		95,
		true
	},
	pre_combat_main = {
		705799,
		91,
		true
	},
	pre_combat_submarine = {
		705890,
		96,
		true
	},
	pre_combat_targets = {
		705986,
		88,
		true
	},
	pre_combat_atlasloot = {
		706074,
		90,
		true
	},
	destroy_confirm_access = {
		706164,
		93,
		true
	},
	destroy_confirm_cancel = {
		706257,
		93,
		true
	},
	pt_count_tip = {
		706350,
		82,
		true
	},
	dockyard_data_loss_detected = {
		706432,
		140,
		true
	},
	littleEugen_npc = {
		706572,
		1035,
		true
	},
	five_shujuhuigu = {
		707607,
		91,
		true
	},
	five_shujuhuigu1 = {
		707698,
		91,
		true
	},
	littleChaijun_npc = {
		707789,
		1017,
		true
	},
	five_qingdian = {
		708806,
		684,
		true
	},
	friend_resume_title_detail = {
		709490,
		102,
		true
	},
	item_type13_tip1 = {
		709592,
		92,
		true
	},
	item_type13_tip2 = {
		709684,
		92,
		true
	},
	item_type16_tip1 = {
		709776,
		92,
		true
	},
	item_type16_tip2 = {
		709868,
		92,
		true
	},
	item_type17_tip1 = {
		709960,
		92,
		true
	},
	item_type17_tip2 = {
		710052,
		92,
		true
	},
	five_duomaomao = {
		710144,
		816,
		true
	},
	main_4 = {
		710960,
		82,
		true
	},
	main_5 = {
		711042,
		82,
		true
	},
	honor_medal_support_tips_display = {
		711124,
		448,
		true
	},
	honor_medal_support_tips_confirm = {
		711572,
		213,
		true
	},
	support_rate_title = {
		711785,
		94,
		true
	},
	support_times_limited = {
		711879,
		121,
		true
	},
	support_times_tip = {
		712000,
		93,
		true
	},
	build_times_tip = {
		712093,
		91,
		true
	},
	tactics_recent_ship_label = {
		712184,
		101,
		true
	},
	title_info = {
		712285,
		80,
		true
	},
	eventshop_unlock_info = {
		712365,
		93,
		true
	},
	eventshop_unlock_hint = {
		712458,
		117,
		true
	},
	commission_event_tip = {
		712575,
		765,
		true
	},
	decoration_medal_placeholder = {
		713340,
		116,
		true
	},
	technology_filter_placeholder = {
		713456,
		114,
		true
	},
	eva_comment_send_null = {
		713570,
		100,
		true
	},
	report_sent_thank = {
		713670,
		154,
		true
	},
	report_ship_cannot_comment = {
		713824,
		117,
		true
	},
	report_cannot_comment = {
		713941,
		137,
		true
	},
	report_sent_title = {
		714078,
		87,
		true
	},
	report_sent_desc = {
		714165,
		113,
		true
	},
	report_type_1 = {
		714278,
		89,
		true
	},
	report_type_1_1 = {
		714367,
		100,
		true
	},
	report_type_2 = {
		714467,
		89,
		true
	},
	report_type_2_1 = {
		714556,
		100,
		true
	},
	report_type_3 = {
		714656,
		89,
		true
	},
	report_type_3_1 = {
		714745,
		100,
		true
	},
	report_type_other = {
		714845,
		87,
		true
	},
	report_type_other_1 = {
		714932,
		125,
		true
	},
	report_type_other_2 = {
		715057,
		107,
		true
	},
	report_sent_help = {
		715164,
		431,
		true
	},
	rename_input = {
		715595,
		88,
		true
	},
	avatar_task_level = {
		715683,
		125,
		true
	},
	avatar_upgrad_1 = {
		715808,
		94,
		true
	},
	avatar_upgrad_2 = {
		715902,
		94,
		true
	},
	avatar_upgrad_3 = {
		715996,
		85,
		true
	},
	avatar_task_ship_1 = {
		716081,
		102,
		true
	},
	avatar_task_ship_2 = {
		716183,
		105,
		true
	},
	technology_queue_complete = {
		716288,
		101,
		true
	},
	technology_queue_processing = {
		716389,
		100,
		true
	},
	technology_queue_waiting = {
		716489,
		100,
		true
	},
	technology_queue_getaward = {
		716589,
		101,
		true
	},
	technology_daily_refresh = {
		716690,
		110,
		true
	},
	technology_queue_full = {
		716800,
		118,
		true
	},
	technology_queue_in_mission_incomplete = {
		716918,
		151,
		true
	},
	technology_consume = {
		717069,
		94,
		true
	},
	technology_request = {
		717163,
		100,
		true
	},
	technology_queue_in_doublecheck = {
		717263,
		201,
		true
	},
	playervtae_setting_btn_label = {
		717464,
		104,
		true
	},
	technology_queue_in_success = {
		717568,
		109,
		true
	},
	star_require_enemy_text = {
		717677,
		135,
		true
	},
	star_require_enemy_title = {
		717812,
		106,
		true
	},
	star_require_enemy_check = {
		717918,
		94,
		true
	},
	worldboss_rank_timer_label = {
		718012,
		118,
		true
	},
	technology_detail = {
		718130,
		93,
		true
	},
	technology_mission_unfinish = {
		718223,
		106,
		true
	},
	word_chinese = {
		718329,
		82,
		true
	},
	word_japanese_2 = {
		718411,
		86,
		true
	},
	word_japanese = {
		718497,
		83,
		true
	},
	avatarframe_got = {
		718580,
		88,
		true
	},
	item_is_max_cnt = {
		718668,
		103,
		true
	},
	level_fleet_ship_desc = {
		718771,
		106,
		true
	},
	level_fleet_sub_desc = {
		718877,
		102,
		true
	},
	summerland_tip = {
		718979,
		375,
		true
	},
	icecreamgame_tip = {
		719354,
		1431,
		true
	},
	unlock_date_tip = {
		720785,
		118,
		true
	},
	guild_duty_shoule_be_deputy_commander = {
		720903,
		147,
		true
	},
	guild_deputy_commander_cnt_is_full = {
		721050,
		134,
		true
	},
	guild_deputy_commander_cnt = {
		721184,
		154,
		true
	},
	mail_filter_placeholder = {
		721338,
		105,
		true
	},
	recently_sticker_placeholder = {
		721443,
		110,
		true
	},
	backhill_campusfestival_tip = {
		721553,
		1085,
		true
	},
	mini_cookgametip = {
		722638,
		717,
		true
	},
	cook_game_Albacore = {
		723355,
		103,
		true
	},
	cook_game_august = {
		723458,
		98,
		true
	},
	cook_game_elbe = {
		723556,
		99,
		true
	},
	cook_game_hakuryu = {
		723655,
		120,
		true
	},
	cook_game_howe = {
		723775,
		124,
		true
	},
	cook_game_marcopolo = {
		723899,
		107,
		true
	},
	cook_game_noshiro = {
		724006,
		106,
		true
	},
	cook_game_pnelope = {
		724112,
		118,
		true
	},
	cook_game_laffey = {
		724230,
		127,
		true
	},
	cook_game_janus = {
		724357,
		131,
		true
	},
	cook_game_flandre = {
		724488,
		111,
		true
	},
	cook_game_constellation = {
		724599,
		165,
		true
	},
	cook_game_constellation_skill_name = {
		724764,
		146,
		true
	},
	cook_game_constellation_skill_desc = {
		724910,
		233,
		true
	},
	random_ship_on = {
		725143,
		108,
		true
	},
	random_ship_off_0 = {
		725251,
		154,
		true
	},
	random_ship_off = {
		725405,
		137,
		true
	},
	random_ship_forbidden = {
		725542,
		155,
		true
	},
	random_ship_now = {
		725697,
		97,
		true
	},
	random_ship_label = {
		725794,
		96,
		true
	},
	player_vitae_skin_setting = {
		725890,
		107,
		true
	},
	random_ship_tips1 = {
		725997,
		133,
		true
	},
	random_ship_tips2 = {
		726130,
		120,
		true
	},
	random_ship_before = {
		726250,
		103,
		true
	},
	random_ship_and_skin_title = {
		726353,
		117,
		true
	},
	random_ship_frequse_mode = {
		726470,
		100,
		true
	},
	random_ship_locked_mode = {
		726570,
		102,
		true
	},
	littleSpee_npc = {
		726672,
		1185,
		true
	},
	random_flag_ship = {
		727857,
		95,
		true
	},
	random_flag_ship_changskinBtn_label = {
		727952,
		111,
		true
	},
	expedition_drop_use_out = {
		728063,
		133,
		true
	},
	expedition_extra_drop_tip = {
		728196,
		110,
		true
	},
	ex_pass_use = {
		728306,
		81,
		true
	},
	defense_formation_tip_npc = {
		728387,
		183,
		true
	},
	word_item = {
		728570,
		79,
		true
	},
	word_tool = {
		728649,
		79,
		true
	},
	word_other = {
		728728,
		80,
		true
	},
	ryza_word_equip = {
		728808,
		85,
		true
	},
	ryza_rest_produce_count = {
		728893,
		113,
		true
	},
	ryza_composite_confirm = {
		729006,
		115,
		true
	},
	ryza_composite_confirm_single = {
		729121,
		117,
		true
	},
	ryza_composite_count = {
		729238,
		99,
		true
	},
	ryza_toggle_only_composite = {
		729337,
		108,
		true
	},
	ryza_tip_select_recipe = {
		729445,
		122,
		true
	},
	ryza_tip_put_materials = {
		729567,
		126,
		true
	},
	ryza_tip_composite_unlock = {
		729693,
		131,
		true
	},
	ryza_tip_unlock_all_tools = {
		729824,
		128,
		true
	},
	ryza_material_not_enough = {
		729952,
		143,
		true
	},
	ryza_tip_composite_invalid = {
		730095,
		126,
		true
	},
	ryza_tip_max_composite_count = {
		730221,
		128,
		true
	},
	ryza_tip_no_item = {
		730349,
		106,
		true
	},
	ryza_ui_show_acess = {
		730455,
		101,
		true
	},
	ryza_tip_no_recipe = {
		730556,
		105,
		true
	},
	ryza_tip_item_access = {
		730661,
		123,
		true
	},
	ryza_tip_control_buff_not_obtain_tip = {
		730784,
		131,
		true
	},
	ryza_tip_control_buff_upgrade = {
		730915,
		99,
		true
	},
	ryza_tip_control_buff_replace = {
		731014,
		99,
		true
	},
	ryza_tip_control_buff_limit = {
		731113,
		103,
		true
	},
	ryza_tip_control_buff_already_active_tip = {
		731216,
		113,
		true
	},
	ryza_tip_control_buff = {
		731329,
		125,
		true
	},
	ryza_tip_control_buff_not_obtain = {
		731454,
		105,
		true
	},
	ryza_tip_control = {
		731559,
		132,
		true
	},
	ryza_tip_main = {
		731691,
		1118,
		true
	},
	battle_levelScene_ryza_lock = {
		732809,
		163,
		true
	},
	ryza_tip_toast_item_got = {
		732972,
		99,
		true
	},
	ryza_composite_help_tip = {
		733071,
		476,
		true
	},
	ryza_control_help_tip = {
		733547,
		296,
		true
	},
	ryza_mini_game = {
		733843,
		351,
		true
	},
	ryza_task_level_desc = {
		734194,
		96,
		true
	},
	ryza_task_tag_explore = {
		734290,
		91,
		true
	},
	ryza_task_tag_battle = {
		734381,
		90,
		true
	},
	ryza_task_tag_dalegate = {
		734471,
		92,
		true
	},
	ryza_task_tag_develop = {
		734563,
		91,
		true
	},
	ryza_task_tag_adventure = {
		734654,
		93,
		true
	},
	ryza_task_tag_build = {
		734747,
		89,
		true
	},
	ryza_task_tag_create = {
		734836,
		90,
		true
	},
	ryza_task_tag_daily = {
		734926,
		89,
		true
	},
	ryza_task_detail_content = {
		735015,
		94,
		true
	},
	ryza_task_detail_award = {
		735109,
		92,
		true
	},
	ryza_task_go = {
		735201,
		82,
		true
	},
	ryza_task_get = {
		735283,
		83,
		true
	},
	ryza_task_get_all = {
		735366,
		93,
		true
	},
	ryza_task_confirm = {
		735459,
		87,
		true
	},
	ryza_task_cancel = {
		735546,
		86,
		true
	},
	ryza_task_level_num = {
		735632,
		95,
		true
	},
	ryza_task_level_add = {
		735727,
		95,
		true
	},
	ryza_task_submit = {
		735822,
		86,
		true
	},
	ryza_task_detail = {
		735908,
		86,
		true
	},
	ryza_composite_words = {
		735994,
		707,
		true
	},
	ryza_task_help_tip = {
		736701,
		345,
		true
	},
	hotspring_buff = {
		737046,
		127,
		true
	},
	random_ship_custom_mode_empty = {
		737173,
		157,
		true
	},
	random_ship_custom_mode_main_button_add = {
		737330,
		109,
		true
	},
	random_ship_custom_mode_main_button_remove = {
		737439,
		112,
		true
	},
	random_ship_custom_mode_main_tip1 = {
		737551,
		140,
		true
	},
	random_ship_custom_mode_main_tip2 = {
		737691,
		112,
		true
	},
	random_ship_custom_mode_main_empty = {
		737803,
		128,
		true
	},
	random_ship_custom_mode_select_all = {
		737931,
		110,
		true
	},
	random_ship_custom_mode_add_tip1 = {
		738041,
		133,
		true
	},
	random_ship_custom_mode_select_number = {
		738174,
		113,
		true
	},
	random_ship_custom_mode_add_complete = {
		738287,
		118,
		true
	},
	random_ship_custom_mode_add_tip2 = {
		738405,
		139,
		true
	},
	random_ship_custom_mode_remove_tip1 = {
		738544,
		139,
		true
	},
	random_ship_custom_mode_remove_complete = {
		738683,
		121,
		true
	},
	random_ship_custom_mode_remove_tip2 = {
		738804,
		142,
		true
	},
	index_dressed = {
		738946,
		86,
		true
	},
	random_ship_custom_mode = {
		739032,
		111,
		true
	},
	random_ship_custom_mode_add_title = {
		739143,
		109,
		true
	},
	random_ship_custom_mode_remove_title = {
		739252,
		112,
		true
	},
	hotspring_shop_enter1 = {
		739364,
		149,
		true
	},
	hotspring_shop_enter2 = {
		739513,
		159,
		true
	},
	hotspring_shop_insufficient = {
		739672,
		166,
		true
	},
	hotspring_shop_success1 = {
		739838,
		103,
		true
	},
	hotspring_shop_success2 = {
		739941,
		112,
		true
	},
	hotspring_shop_finish = {
		740053,
		155,
		true
	},
	hotspring_shop_end = {
		740208,
		166,
		true
	},
	hotspring_shop_touch1 = {
		740374,
		121,
		true
	},
	hotspring_shop_touch2 = {
		740495,
		140,
		true
	},
	hotspring_shop_touch3 = {
		740635,
		131,
		true
	},
	hotspring_shop_exchanged = {
		740766,
		151,
		true
	},
	hotspring_shop_exchange = {
		740917,
		167,
		true
	},
	hotspring_tip1 = {
		741084,
		130,
		true
	},
	hotspring_tip2 = {
		741214,
		94,
		true
	},
	hotspring_help = {
		741308,
		525,
		true
	},
	hotspring_expand = {
		741833,
		150,
		true
	},
	hotspring_shop_help = {
		741983,
		387,
		true
	},
	resorts_help = {
		742370,
		585,
		true
	},
	pvzminigame_help = {
		742955,
		1204,
		true
	},
	tips_yuandanhuoyue2023 = {
		744159,
		658,
		true
	},
	beach_guard_chaijun = {
		744817,
		144,
		true
	},
	beach_guard_jianye = {
		744961,
		155,
		true
	},
	beach_guard_lituoliao = {
		745116,
		243,
		true
	},
	beach_guard_bominghan = {
		745359,
		231,
		true
	},
	beach_guard_nengdai = {
		745590,
		262,
		true
	},
	beach_guard_m_craft = {
		745852,
		119,
		true
	},
	beach_guard_m_atk = {
		745971,
		114,
		true
	},
	beach_guard_m_guard = {
		746085,
		113,
		true
	},
	beach_guard_m_craft_name = {
		746198,
		97,
		true
	},
	beach_guard_m_atk_name = {
		746295,
		95,
		true
	},
	beach_guard_m_guard_name = {
		746390,
		97,
		true
	},
	beach_guard_e1 = {
		746487,
		87,
		true
	},
	beach_guard_e2 = {
		746574,
		87,
		true
	},
	beach_guard_e3 = {
		746661,
		87,
		true
	},
	beach_guard_e4 = {
		746748,
		87,
		true
	},
	beach_guard_e5 = {
		746835,
		87,
		true
	},
	beach_guard_e6 = {
		746922,
		87,
		true
	},
	beach_guard_e7 = {
		747009,
		87,
		true
	},
	beach_guard_e1_desc = {
		747096,
		144,
		true
	},
	beach_guard_e2_desc = {
		747240,
		144,
		true
	},
	beach_guard_e3_desc = {
		747384,
		144,
		true
	},
	beach_guard_e4_desc = {
		747528,
		159,
		true
	},
	beach_guard_e5_desc = {
		747687,
		159,
		true
	},
	beach_guard_e6_desc = {
		747846,
		266,
		true
	},
	beach_guard_e7_desc = {
		748112,
		156,
		true
	},
	ninghai_nianye = {
		748268,
		127,
		true
	},
	yingrui_nianye = {
		748395,
		128,
		true
	},
	zhaohe_nianye = {
		748523,
		135,
		true
	},
	zhenhai_nianye = {
		748658,
		143,
		true
	},
	haitian_nianye = {
		748801,
		154,
		true
	},
	taiyuan_nianye = {
		748955,
		139,
		true
	},
	yixian_nianye = {
		749094,
		144,
		true
	},
	activity_yanhua_tip1 = {
		749238,
		90,
		true
	},
	activity_yanhua_tip2 = {
		749328,
		105,
		true
	},
	activity_yanhua_tip3 = {
		749433,
		105,
		true
	},
	activity_yanhua_tip4 = {
		749538,
		122,
		true
	},
	activity_yanhua_tip5 = {
		749660,
		103,
		true
	},
	activity_yanhua_tip6 = {
		749763,
		112,
		true
	},
	activity_yanhua_tip7 = {
		749875,
		133,
		true
	},
	activity_yanhua_tip8 = {
		750008,
		99,
		true
	},
	help_chunjie2023 = {
		750107,
		1175,
		true
	},
	sevenday_nianye = {
		751282,
		277,
		true
	},
	tip_nianye = {
		751559,
		106,
		true
	},
	couplete_activty_desc = {
		751665,
		348,
		true
	},
	couplete_click_desc = {
		752013,
		125,
		true
	},
	couplet_index_desc = {
		752138,
		90,
		true
	},
	couplete_help = {
		752228,
		862,
		true
	},
	couplete_drag_tip = {
		753090,
		112,
		true
	},
	couplete_remind = {
		753202,
		109,
		true
	},
	couplete_complete = {
		753311,
		139,
		true
	},
	couplete_enter = {
		753450,
		114,
		true
	},
	couplete_stay = {
		753564,
		107,
		true
	},
	couplete_task = {
		753671,
		123,
		true
	},
	couplete_pass_1 = {
		753794,
		104,
		true
	},
	couplete_pass_2 = {
		753898,
		110,
		true
	},
	couplete_fail_1 = {
		754008,
		121,
		true
	},
	couplete_fail_2 = {
		754129,
		112,
		true
	},
	couplete_pair_1 = {
		754241,
		100,
		true
	},
	couplete_pair_2 = {
		754341,
		100,
		true
	},
	couplete_pair_3 = {
		754441,
		100,
		true
	},
	couplete_pair_4 = {
		754541,
		100,
		true
	},
	couplete_pair_5 = {
		754641,
		100,
		true
	},
	couplete_pair_6 = {
		754741,
		100,
		true
	},
	couplete_pair_7 = {
		754841,
		100,
		true
	},
	["2023spring_minigame_item_lantern"] = {
		754941,
		186,
		true
	},
	["2023spring_minigame_item_firecracker"] = {
		755127,
		181,
		true
	},
	["2023spring_minigame_skill_icewall"] = {
		755308,
		141,
		true
	},
	["2023spring_minigame_skill_icewall_up"] = {
		755449,
		197,
		true
	},
	["2023spring_minigame_skill_sprint"] = {
		755646,
		137,
		true
	},
	["2023spring_minigame_skill_sprint_up"] = {
		755783,
		190,
		true
	},
	["2023spring_minigame_skill_flash"] = {
		755973,
		169,
		true
	},
	["2023spring_minigame_skill_flash_up"] = {
		756142,
		177,
		true
	},
	["2023spring_minigame_bless_speed"] = {
		756319,
		126,
		true
	},
	["2023spring_minigame_bless_speed_up"] = {
		756445,
		164,
		true
	},
	["2023spring_minigame_bless_substitute"] = {
		756609,
		188,
		true
	},
	["2023spring_minigame_bless_substitute_up"] = {
		756797,
		115,
		true
	},
	["2023spring_minigame_nenjuu_skill1"] = {
		756912,
		180,
		true
	},
	["2023spring_minigame_nenjuu_skill2"] = {
		757092,
		132,
		true
	},
	["2023spring_minigame_nenjuu_skill3"] = {
		757224,
		133,
		true
	},
	["2023spring_minigame_nenjuu_skill4"] = {
		757357,
		132,
		true
	},
	["2023spring_minigame_nenjuu_skill5"] = {
		757489,
		186,
		true
	},
	["2023spring_minigame_nenjuu_skill6"] = {
		757675,
		138,
		true
	},
	["2023spring_minigame_nenjuu_skill7"] = {
		757813,
		268,
		true
	},
	["2023spring_minigame_nenjuu_skill8"] = {
		758081,
		223,
		true
	},
	["2023spring_minigame_tip1"] = {
		758304,
		94,
		true
	},
	["2023spring_minigame_tip2"] = {
		758398,
		97,
		true
	},
	["2023spring_minigame_tip3"] = {
		758495,
		94,
		true
	},
	["2023spring_minigame_tip5"] = {
		758589,
		121,
		true
	},
	["2023spring_minigame_tip6"] = {
		758710,
		103,
		true
	},
	["2023spring_minigame_tip7"] = {
		758813,
		103,
		true
	},
	["2023spring_minigame_help"] = {
		758916,
		970,
		true
	},
	multiple_sorties_title = {
		759886,
		98,
		true
	},
	multiple_sorties_title_eng = {
		759984,
		106,
		true
	},
	multiple_sorties_locked_tip = {
		760090,
		157,
		true
	},
	multiple_sorties_times = {
		760247,
		98,
		true
	},
	multiple_sorties_tip = {
		760345,
		203,
		true
	},
	multiple_sorties_challenge_ticket_use = {
		760548,
		113,
		true
	},
	multiple_sorties_cost1 = {
		760661,
		164,
		true
	},
	multiple_sorties_cost2 = {
		760825,
		170,
		true
	},
	multiple_sorties_cost3 = {
		760995,
		176,
		true
	},
	multiple_sorties_stopped = {
		761171,
		97,
		true
	},
	multiple_sorties_stop_tip = {
		761268,
		170,
		true
	},
	multiple_sorties_resume_tip = {
		761438,
		139,
		true
	},
	multiple_sorties_auto_on = {
		761577,
		133,
		true
	},
	multiple_sorties_finish = {
		761710,
		111,
		true
	},
	multiple_sorties_stop = {
		761821,
		109,
		true
	},
	multiple_sorties_stop_end = {
		761930,
		116,
		true
	},
	multiple_sorties_end_status = {
		762046,
		184,
		true
	},
	multiple_sorties_finish_tip = {
		762230,
		136,
		true
	},
	multiple_sorties_stop_tip_end = {
		762366,
		141,
		true
	},
	multiple_sorties_stop_reason1 = {
		762507,
		128,
		true
	},
	multiple_sorties_stop_reason2 = {
		762635,
		149,
		true
	},
	multiple_sorties_stop_reason3 = {
		762784,
		105,
		true
	},
	multiple_sorties_stop_reason4 = {
		762889,
		105,
		true
	},
	multiple_sorties_main_tip = {
		762994,
		325,
		true
	},
	multiple_sorties_main_end = {
		763319,
		188,
		true
	},
	multiple_sorties_rest_time = {
		763507,
		102,
		true
	},
	multiple_sorties_retry_desc = {
		763609,
		108,
		true
	},
	msgbox_text_battle = {
		763717,
		88,
		true
	},
	pre_combat_start = {
		763805,
		86,
		true
	},
	pre_combat_start_en = {
		763891,
		95,
		true
	},
	["2023Valentine_minigame_s"] = {
		763986,
		194,
		true
	},
	["2023Valentine_minigame_a"] = {
		764180,
		176,
		true
	},
	["2023Valentine_minigame_b"] = {
		764356,
		167,
		true
	},
	["2023Valentine_minigame_c"] = {
		764523,
		179,
		true
	},
	["2023Valentine_minigame_label1"] = {
		764702,
		108,
		true
	},
	["2023Valentine_minigame_label2"] = {
		764810,
		105,
		true
	},
	["2023Valentine_minigame_label3"] = {
		764915,
		108,
		true
	},
	sort_energy = {
		765023,
		84,
		true
	},
	dockyard_search_holder = {
		765107,
		101,
		true
	},
	loveletter_exchange_tip1 = {
		765208,
		134,
		true
	},
	loveletter_exchange_tip2 = {
		765342,
		149,
		true
	},
	loveletter_exchange_confirm = {
		765491,
		372,
		true
	},
	loveletter_exchange_button = {
		765863,
		96,
		true
	},
	loveletter_exchange_tip3 = {
		765959,
		124,
		true
	},
	battle_text_common_1 = {
		766083,
		183,
		true
	},
	battle_text_common_2 = {
		766266,
		213,
		true
	},
	battle_text_common_3 = {
		766479,
		189,
		true
	},
	battle_text_yingxiv4_1 = {
		766668,
		152,
		true
	},
	battle_text_yingxiv4_2 = {
		766820,
		152,
		true
	},
	battle_text_yingxiv4_3 = {
		766972,
		152,
		true
	},
	battle_text_yingxiv4_4 = {
		767124,
		149,
		true
	},
	battle_text_yingxiv4_5 = {
		767273,
		149,
		true
	},
	battle_text_yingxiv4_6 = {
		767422,
		164,
		true
	},
	battle_text_yingxiv4_7 = {
		767586,
		167,
		true
	},
	battle_text_yingxiv4_8 = {
		767753,
		167,
		true
	},
	battle_text_yingxiv4_9 = {
		767920,
		155,
		true
	},
	battle_text_yingxiv4_10 = {
		768075,
		171,
		true
	},
	battle_text_bisimaiz_1 = {
		768246,
		138,
		true
	},
	battle_text_bisimaiz_2 = {
		768384,
		138,
		true
	},
	battle_text_bisimaiz_3 = {
		768522,
		138,
		true
	},
	battle_text_bisimaiz_4 = {
		768660,
		138,
		true
	},
	battle_text_bisimaiz_5 = {
		768798,
		138,
		true
	},
	battle_text_bisimaiz_6 = {
		768936,
		138,
		true
	},
	battle_text_bisimaiz_7 = {
		769074,
		171,
		true
	},
	battle_text_bisimaiz_8 = {
		769245,
		218,
		true
	},
	battle_text_bisimaiz_9 = {
		769463,
		213,
		true
	},
	battle_text_bisimaiz_10 = {
		769676,
		181,
		true
	},
	battle_text_yunxian_1 = {
		769857,
		190,
		true
	},
	battle_text_yunxian_2 = {
		770047,
		175,
		true
	},
	battle_text_yunxian_3 = {
		770222,
		146,
		true
	},
	battle_text_haidao_1 = {
		770368,
		155,
		true
	},
	battle_text_haidao_2 = {
		770523,
		182,
		true
	},
	battle_text_tongmeng_1 = {
		770705,
		134,
		true
	},
	battle_text_luodeni_1 = {
		770839,
		172,
		true
	},
	battle_text_luodeni_2 = {
		771011,
		184,
		true
	},
	battle_text_luodeni_3 = {
		771195,
		175,
		true
	},
	series_enemy_mood = {
		771370,
		93,
		true
	},
	series_enemy_mood_error = {
		771463,
		153,
		true
	},
	series_enemy_reward_tip1 = {
		771616,
		107,
		true
	},
	series_enemy_reward_tip2 = {
		771723,
		113,
		true
	},
	series_enemy_reward_tip3 = {
		771836,
		101,
		true
	},
	series_enemy_reward_tip4 = {
		771937,
		107,
		true
	},
	series_enemy_cost = {
		772044,
		96,
		true
	},
	series_enemy_SP_count = {
		772140,
		100,
		true
	},
	series_enemy_SP_error = {
		772240,
		111,
		true
	},
	series_enemy_unlock = {
		772351,
		117,
		true
	},
	series_enemy_storyunlock = {
		772468,
		112,
		true
	},
	series_enemy_storyreward = {
		772580,
		106,
		true
	},
	series_enemy_help = {
		772686,
		990,
		true
	},
	series_enemy_score = {
		773676,
		88,
		true
	},
	series_enemy_total_score = {
		773764,
		97,
		true
	},
	setting_label_private = {
		773861,
		97,
		true
	},
	setting_label_licence = {
		773958,
		97,
		true
	},
	series_enemy_reward = {
		774055,
		95,
		true
	},
	series_enemy_mode_1 = {
		774150,
		98,
		true
	},
	series_enemy_mode_2 = {
		774248,
		96,
		true
	},
	series_enemy_fleet_prefix = {
		774344,
		97,
		true
	},
	series_enemy_team_notenough = {
		774441,
		201,
		true
	},
	series_enemy_empty_commander_main = {
		774642,
		109,
		true
	},
	series_enemy_empty_commander_assistant = {
		774751,
		114,
		true
	},
	limit_team_character_tips = {
		774865,
		135,
		true
	},
	game_room_help = {
		775000,
		779,
		true
	},
	game_cannot_go = {
		775779,
		114,
		true
	},
	game_ticket_notenough = {
		775893,
		143,
		true
	},
	game_ticket_max_all = {
		776036,
		204,
		true
	},
	game_ticket_max_month = {
		776240,
		213,
		true
	},
	game_icon_notenough = {
		776453,
		154,
		true
	},
	game_goldbyicon = {
		776607,
		117,
		true
	},
	game_icon_max = {
		776724,
		180,
		true
	},
	caibulin_tip1 = {
		776904,
		121,
		true
	},
	caibulin_tip2 = {
		777025,
		149,
		true
	},
	caibulin_tip3 = {
		777174,
		121,
		true
	},
	caibulin_tip4 = {
		777295,
		149,
		true
	},
	caibulin_tip5 = {
		777444,
		121,
		true
	},
	caibulin_tip6 = {
		777565,
		149,
		true
	},
	caibulin_tip7 = {
		777714,
		121,
		true
	},
	caibulin_tip8 = {
		777835,
		149,
		true
	},
	caibulin_tip9 = {
		777984,
		152,
		true
	},
	caibulin_tip10 = {
		778136,
		153,
		true
	},
	caibulin_help = {
		778289,
		416,
		true
	},
	caibulin_tip11 = {
		778705,
		150,
		true
	},
	caibulin_lock_tip = {
		778855,
		124,
		true
	},
	gametip_xiaoqiye = {
		778979,
		1026,
		true
	},
	event_recommend_level1 = {
		780005,
		181,
		true
	},
	doa_minigame_Luna = {
		780186,
		87,
		true
	},
	doa_minigame_Misaki = {
		780273,
		89,
		true
	},
	doa_minigame_Marie = {
		780362,
		94,
		true
	},
	doa_minigame_Tamaki = {
		780456,
		86,
		true
	},
	doa_minigame_help = {
		780542,
		308,
		true
	},
	gametip_xiaokewei = {
		780850,
		1030,
		true
	},
	doa_character_select_confirm = {
		781880,
		223,
		true
	},
	blueprint_combatperformance = {
		782103,
		103,
		true
	},
	blueprint_shipperformance = {
		782206,
		101,
		true
	},
	blueprint_researching = {
		782307,
		103,
		true
	},
	sculpture_drawline_tip = {
		782410,
		111,
		true
	},
	sculpture_drawline_done = {
		782521,
		151,
		true
	},
	sculpture_drawline_exit = {
		782672,
		176,
		true
	},
	sculpture_puzzle_tip = {
		782848,
		158,
		true
	},
	sculpture_gratitude_tip = {
		783006,
		115,
		true
	},
	sculpture_close_tip = {
		783121,
		102,
		true
	},
	gift_act_help = {
		783223,
		456,
		true
	},
	gift_act_drawline_help = {
		783679,
		465,
		true
	},
	gift_act_tips = {
		784144,
		85,
		true
	},
	expedition_award_tip = {
		784229,
		151,
		true
	},
	island_act_tips1 = {
		784380,
		107,
		true
	},
	haidaojudian_help = {
		784487,
		1318,
		true
	},
	haidaojudian_building_tip = {
		785805,
		119,
		true
	},
	workbench_help = {
		785924,
		600,
		true
	},
	workbench_need_materials = {
		786524,
		100,
		true
	},
	workbench_tips1 = {
		786624,
		100,
		true
	},
	workbench_tips2 = {
		786724,
		91,
		true
	},
	workbench_tips3 = {
		786815,
		115,
		true
	},
	workbench_tips4 = {
		786930,
		105,
		true
	},
	workbench_tips5 = {
		787035,
		105,
		true
	},
	workbench_tips6 = {
		787140,
		97,
		true
	},
	workbench_tips7 = {
		787237,
		85,
		true
	},
	workbench_tips8 = {
		787322,
		91,
		true
	},
	workbench_tips9 = {
		787413,
		91,
		true
	},
	workbench_tips10 = {
		787504,
		98,
		true
	},
	island_help = {
		787602,
		610,
		true
	},
	islandnode_tips1 = {
		788212,
		92,
		true
	},
	islandnode_tips2 = {
		788304,
		86,
		true
	},
	islandnode_tips3 = {
		788390,
		102,
		true
	},
	islandnode_tips4 = {
		788492,
		107,
		true
	},
	islandnode_tips5 = {
		788599,
		138,
		true
	},
	islandnode_tips6 = {
		788737,
		114,
		true
	},
	islandnode_tips7 = {
		788851,
		137,
		true
	},
	islandnode_tips8 = {
		788988,
		168,
		true
	},
	islandnode_tips9 = {
		789156,
		154,
		true
	},
	islandshop_tips1 = {
		789310,
		98,
		true
	},
	islandshop_tips2 = {
		789408,
		86,
		true
	},
	islandshop_tips3 = {
		789494,
		86,
		true
	},
	islandshop_tips4 = {
		789580,
		88,
		true
	},
	island_shop_limit_error = {
		789668,
		136,
		true
	},
	haidaojudian_upgrade_limit = {
		789804,
		167,
		true
	},
	chargetip_monthcard_1 = {
		789971,
		127,
		true
	},
	chargetip_monthcard_2 = {
		790098,
		134,
		true
	},
	chargetip_crusing = {
		790232,
		108,
		true
	},
	chargetip_giftpackage = {
		790340,
		115,
		true
	},
	package_view_1 = {
		790455,
		117,
		true
	},
	package_view_2 = {
		790572,
		133,
		true
	},
	package_view_3 = {
		790705,
		105,
		true
	},
	package_view_4 = {
		790810,
		90,
		true
	},
	probabilityskinshop_tip = {
		790900,
		142,
		true
	},
	skin_gift_desc = {
		791042,
		233,
		true
	},
	springtask_tip = {
		791275,
		311,
		true
	},
	island_build_desc = {
		791586,
		124,
		true
	},
	island_history_desc = {
		791710,
		151,
		true
	},
	island_build_level = {
		791861,
		94,
		true
	},
	island_game_limit_help = {
		791955,
		138,
		true
	},
	island_game_limit_num = {
		792093,
		94,
		true
	},
	ore_minigame_help = {
		792187,
		596,
		true
	},
	meta_shop_exchange_limit_2 = {
		792783,
		102,
		true
	},
	meta_shop_tip = {
		792885,
		135,
		true
	},
	pt_shop_tran_tip = {
		793020,
		309,
		true
	},
	urdraw_tip = {
		793329,
		138,
		true
	},
	urdraw_complement = {
		793467,
		169,
		true
	},
	meta_class_t_level_1 = {
		793636,
		96,
		true
	},
	meta_class_t_level_2 = {
		793732,
		96,
		true
	},
	meta_class_t_level_3 = {
		793828,
		96,
		true
	},
	meta_class_t_level_4 = {
		793924,
		96,
		true
	},
	meta_class_t_level_5 = {
		794020,
		96,
		true
	},
	meta_shop_exchange_limit_tip = {
		794116,
		112,
		true
	},
	meta_shop_exchange_limit_2_tip = {
		794228,
		149,
		true
	},
	charge_tip_crusing_label = {
		794377,
		100,
		true
	},
	mktea_1 = {
		794477,
		132,
		true
	},
	mktea_2 = {
		794609,
		132,
		true
	},
	mktea_3 = {
		794741,
		132,
		true
	},
	mktea_4 = {
		794873,
		177,
		true
	},
	mktea_5 = {
		795050,
		186,
		true
	},
	random_skin_list_item_desc_label = {
		795236,
		103,
		true
	},
	notice_input_desc = {
		795339,
		104,
		true
	},
	notice_label_send = {
		795443,
		93,
		true
	},
	notice_label_room = {
		795536,
		96,
		true
	},
	notice_label_recv = {
		795632,
		93,
		true
	},
	notice_label_tip = {
		795725,
		130,
		true
	},
	littleTaihou_npc = {
		795855,
		1208,
		true
	},
	disassemble_selected = {
		797063,
		93,
		true
	},
	disassemble_available = {
		797156,
		94,
		true
	},
	ship_formationUI_fleetName_challenge = {
		797250,
		118,
		true
	},
	ship_formationUI_fleetName_challenge_sub = {
		797368,
		122,
		true
	},
	word_status_activity = {
		797490,
		99,
		true
	},
	word_status_challenge = {
		797589,
		106,
		true
	},
	shipmodechange_reject_inactivity = {
		797695,
		167,
		true
	},
	shipmodechange_reject_inchallenge = {
		797862,
		161,
		true
	},
	battle_result_total_time = {
		798023,
		103,
		true
	},
	charge_game_room_coin_tip = {
		798126,
		231,
		true
	},
	game_room_shooting_tip = {
		798357,
		101,
		true
	},
	mini_game_shop_ticked_not_enough = {
		798458,
		154,
		true
	},
	game_ticket_current_month = {
		798612,
		101,
		true
	},
	game_icon_max_full = {
		798713,
		128,
		true
	},
	pre_combat_consume = {
		798841,
		91,
		true
	},
	file_down_msgbox = {
		798932,
		232,
		true
	},
	file_down_mgr_title = {
		799164,
		98,
		true
	},
	file_down_mgr_progress = {
		799262,
		91,
		true
	},
	file_down_mgr_error = {
		799353,
		135,
		true
	},
	last_building_not_shown = {
		799488,
		133,
		true
	},
	setting_group_prefs_tip = {
		799621,
		108,
		true
	},
	group_prefs_switch_tip = {
		799729,
		144,
		true
	},
	main_group_msgbox_content = {
		799873,
		225,
		true
	},
	word_maingroup_checking = {
		800098,
		96,
		true
	},
	word_maingroup_checktoupdate = {
		800194,
		104,
		true
	},
	word_maingroup_checkfailure = {
		800298,
		118,
		true
	},
	word_maingroup_updating = {
		800416,
		99,
		true
	},
	word_maingroup_updatesuccess = {
		800515,
		104,
		true
	},
	word_maingroup_updatefailure = {
		800619,
		119,
		true
	},
	group_download_tip = {
		800738,
		136,
		true
	},
	word_manga_checking = {
		800874,
		92,
		true
	},
	word_manga_checktoupdate = {
		800966,
		100,
		true
	},
	word_manga_checkfailure = {
		801066,
		114,
		true
	},
	word_manga_updating = {
		801180,
		107,
		true
	},
	word_manga_updatesuccess = {
		801287,
		100,
		true
	},
	word_manga_updatefailure = {
		801387,
		115,
		true
	},
	cryptolalia_lock_res = {
		801502,
		102,
		true
	},
	cryptolalia_not_download_res = {
		801604,
		113,
		true
	},
	cryptolalia_timelimie = {
		801717,
		91,
		true
	},
	cryptolalia_label_downloading = {
		801808,
		114,
		true
	},
	cryptolalia_delete_res = {
		801922,
		102,
		true
	},
	cryptolalia_delete_res_tip = {
		802024,
		118,
		true
	},
	cryptolalia_delete_res_title = {
		802142,
		104,
		true
	},
	cryptolalia_use_gem_title = {
		802246,
		112,
		true
	},
	cryptolalia_use_ticket_title = {
		802358,
		115,
		true
	},
	cryptolalia_exchange = {
		802473,
		96,
		true
	},
	cryptolalia_exchange_success = {
		802569,
		104,
		true
	},
	cryptolalia_list_title = {
		802673,
		98,
		true
	},
	cryptolalia_list_subtitle = {
		802771,
		97,
		true
	},
	cryptolalia_download_done = {
		802868,
		101,
		true
	},
	cryptolalia_coming_soom = {
		802969,
		102,
		true
	},
	cryptolalia_unopen = {
		803071,
		94,
		true
	},
	cryptolalia_no_ticket = {
		803165,
		146,
		true
	},
	cryptolalia_entrance_coming_soom = {
		803311,
		123,
		true
	},
	ship_formationUI_fleetName_sp = {
		803434,
		111,
		true
	},
	ship_formationUI_fleetName_sp_ss = {
		803545,
		120,
		true
	},
	activityboss_sp_all_buff = {
		803665,
		100,
		true
	},
	activityboss_sp_best_score = {
		803765,
		102,
		true
	},
	activityboss_sp_display_reward = {
		803867,
		106,
		true
	},
	activityboss_sp_score_bonus = {
		803973,
		103,
		true
	},
	activityboss_sp_active_buff = {
		804076,
		103,
		true
	},
	activityboss_sp_window_best_score = {
		804179,
		115,
		true
	},
	activityboss_sp_score_target = {
		804294,
		107,
		true
	},
	activityboss_sp_score = {
		804401,
		97,
		true
	},
	activityboss_sp_score_update = {
		804498,
		110,
		true
	},
	activityboss_sp_score_not_update = {
		804608,
		111,
		true
	},
	collect_page_got = {
		804719,
		92,
		true
	},
	charge_menu_month_tip = {
		804811,
		136,
		true
	},
	activity_shop_title = {
		804947,
		89,
		true
	},
	street_shop_title = {
		805036,
		87,
		true
	},
	military_shop_title = {
		805123,
		89,
		true
	},
	quota_shop_title1 = {
		805212,
		109,
		true
	},
	sham_shop_title = {
		805321,
		107,
		true
	},
	fragment_shop_title = {
		805428,
		89,
		true
	},
	guild_shop_title = {
		805517,
		86,
		true
	},
	medal_shop_title = {
		805603,
		86,
		true
	},
	meta_shop_title = {
		805689,
		83,
		true
	},
	mini_game_shop_title = {
		805772,
		90,
		true
	},
	metaskill_up = {
		805862,
		196,
		true
	},
	metaskill_overflow_tip = {
		806058,
		157,
		true
	},
	msgbox_repair_cipher = {
		806215,
		96,
		true
	},
	msgbox_repair_title = {
		806311,
		89,
		true
	},
	equip_skin_detail_count = {
		806400,
		94,
		true
	},
	faest_nothing_to_get = {
		806494,
		108,
		true
	},
	feast_click_to_close = {
		806602,
		112,
		true
	},
	feast_invitation_btn_label = {
		806714,
		102,
		true
	},
	feast_task_btn_label = {
		806816,
		96,
		true
	},
	feast_task_pt_label = {
		806912,
		93,
		true
	},
	feast_task_pt_level = {
		807005,
		88,
		true
	},
	feast_task_pt_get = {
		807093,
		90,
		true
	},
	feast_task_pt_got = {
		807183,
		90,
		true
	},
	feast_task_tag_daily = {
		807273,
		97,
		true
	},
	feast_task_tag_activity = {
		807370,
		100,
		true
	},
	feast_label_make_invitation = {
		807470,
		106,
		true
	},
	feast_no_invitation = {
		807576,
		98,
		true
	},
	feast_no_gift = {
		807674,
		98,
		true
	},
	feast_label_give_invitation = {
		807772,
		106,
		true
	},
	feast_label_give_invitation_finish = {
		807878,
		107,
		true
	},
	feast_label_give_gift = {
		807985,
		100,
		true
	},
	feast_label_give_gift_finish = {
		808085,
		101,
		true
	},
	feast_label_make_ticket_tip = {
		808186,
		140,
		true
	},
	feast_label_make_ticket_click_tip = {
		808326,
		121,
		true
	},
	feast_label_make_ticket_failed_tip = {
		808447,
		139,
		true
	},
	feast_res_window_title = {
		808586,
		92,
		true
	},
	feast_res_window_go_label = {
		808678,
		95,
		true
	},
	feast_tip = {
		808773,
		422,
		true
	},
	feast_invitation_part1 = {
		809195,
		188,
		true
	},
	feast_invitation_part2 = {
		809383,
		241,
		true
	},
	feast_invitation_part3 = {
		809624,
		259,
		true
	},
	feast_invitation_part4 = {
		809883,
		189,
		true
	},
	uscastle2023_help = {
		810072,
		933,
		true
	},
	feast_cant_give_gift_tip = {
		811005,
		147,
		true
	},
	uscastle2023_minigame_help = {
		811152,
		367,
		true
	},
	feast_drag_invitation_tip = {
		811519,
		130,
		true
	},
	feast_drag_gift_tip = {
		811649,
		120,
		true
	},
	shoot_preview = {
		811769,
		89,
		true
	},
	hit_preview = {
		811858,
		87,
		true
	},
	story_label_skip = {
		811945,
		86,
		true
	},
	story_label_auto = {
		812031,
		86,
		true
	},
	launch_ball_skill_desc = {
		812117,
		98,
		true
	},
	launch_ball_hatsuduki_skill_1 = {
		812215,
		118,
		true
	},
	launch_ball_hatsuduki_skill_1_desc = {
		812333,
		190,
		true
	},
	launch_ball_hatsuduki_skill_2 = {
		812523,
		132,
		true
	},
	launch_ball_hatsuduki_skill_2_desc = {
		812655,
		337,
		true
	},
	launch_ball_shinano_skill_1 = {
		812992,
		116,
		true
	},
	launch_ball_shinano_skill_1_desc = {
		813108,
		175,
		true
	},
	launch_ball_shinano_skill_2 = {
		813283,
		116,
		true
	},
	launch_ball_shinano_skill_2_desc = {
		813399,
		215,
		true
	},
	launch_ball_yura_skill_1 = {
		813614,
		113,
		true
	},
	launch_ball_yura_skill_1_desc = {
		813727,
		149,
		true
	},
	launch_ball_yura_skill_2 = {
		813876,
		113,
		true
	},
	launch_ball_yura_skill_2_desc = {
		813989,
		188,
		true
	},
	launch_ball_shimakaze_skill_1 = {
		814177,
		118,
		true
	},
	launch_ball_shimakaze_skill_1_desc = {
		814295,
		201,
		true
	},
	launch_ball_shimakaze_skill_2 = {
		814496,
		118,
		true
	},
	launch_ball_shimakaze_skill_2_desc = {
		814614,
		184,
		true
	},
	jp6th_spring_tip1 = {
		814798,
		162,
		true
	},
	jp6th_spring_tip2 = {
		814960,
		100,
		true
	},
	jp6th_biaohoushan_help = {
		815060,
		734,
		true
	},
	jp6th_lihoushan_help = {
		815794,
		1928,
		true
	},
	jp6th_lihoushan_time = {
		817722,
		116,
		true
	},
	jp6th_lihoushan_order = {
		817838,
		110,
		true
	},
	jp6th_lihoushan_pt1 = {
		817948,
		113,
		true
	},
	launchball_minigame_help = {
		818061,
		357,
		true
	},
	launchball_minigame_select = {
		818418,
		111,
		true
	},
	launchball_minigame_un_select = {
		818529,
		133,
		true
	},
	launchball_minigame_shop = {
		818662,
		107,
		true
	},
	launchball_lock_Shinano = {
		818769,
		165,
		true
	},
	launchball_lock_Yura = {
		818934,
		162,
		true
	},
	launchball_lock_Shimakaze = {
		819096,
		166,
		true
	},
	launchball_spilt_series = {
		819262,
		151,
		true
	},
	launchball_spilt_mix = {
		819413,
		233,
		true
	},
	launchball_spilt_over = {
		819646,
		191,
		true
	},
	launchball_spilt_many = {
		819837,
		168,
		true
	},
	luckybag_skin_isani = {
		820005,
		95,
		true
	},
	luckybag_skin_islive2d = {
		820100,
		93,
		true
	},
	SkinMagazinePage2_tip = {
		820193,
		97,
		true
	},
	racing_cost = {
		820290,
		88,
		true
	},
	racing_rank_top_text = {
		820378,
		96,
		true
	},
	racing_rank_half_h = {
		820474,
		104,
		true
	},
	racing_rank_no_data = {
		820578,
		106,
		true
	},
	racing_minigame_help = {
		820684,
		357,
		true
	},
	child_msg_title_detail = {
		821041,
		92,
		true
	},
	child_msg_title_tip = {
		821133,
		89,
		true
	},
	child_msg_owned = {
		821222,
		93,
		true
	},
	child_polaroid_get_tip = {
		821315,
		125,
		true
	},
	child_close_tip = {
		821440,
		106,
		true
	},
	word_month = {
		821546,
		77,
		true
	},
	word_which_month = {
		821623,
		88,
		true
	},
	word_which_week = {
		821711,
		87,
		true
	},
	word_in_one_week = {
		821798,
		89,
		true
	},
	word_week_title = {
		821887,
		85,
		true
	},
	word_harbour = {
		821972,
		82,
		true
	},
	child_btn_target = {
		822054,
		86,
		true
	},
	child_btn_collect = {
		822140,
		87,
		true
	},
	child_btn_mind = {
		822227,
		84,
		true
	},
	child_btn_bag = {
		822311,
		83,
		true
	},
	child_btn_news = {
		822394,
		96,
		true
	},
	child_main_help = {
		822490,
		526,
		true
	},
	child_archive_name = {
		823016,
		88,
		true
	},
	child_news_import_title = {
		823104,
		99,
		true
	},
	child_news_other_title = {
		823203,
		98,
		true
	},
	child_favor_progress = {
		823301,
		101,
		true
	},
	child_favor_lock1 = {
		823402,
		101,
		true
	},
	child_favor_lock2 = {
		823503,
		92,
		true
	},
	child_target_lock_tip = {
		823595,
		127,
		true
	},
	child_target_progress = {
		823722,
		97,
		true
	},
	child_target_finish_tip = {
		823819,
		112,
		true
	},
	child_target_time_title = {
		823931,
		108,
		true
	},
	child_target_title1 = {
		824039,
		95,
		true
	},
	child_target_title2 = {
		824134,
		95,
		true
	},
	child_item_type0 = {
		824229,
		86,
		true
	},
	child_item_type1 = {
		824315,
		86,
		true
	},
	child_item_type2 = {
		824401,
		86,
		true
	},
	child_item_type3 = {
		824487,
		86,
		true
	},
	child_item_type4 = {
		824573,
		86,
		true
	},
	child_mind_empty_tip = {
		824659,
		110,
		true
	},
	child_mind_finish_title = {
		824769,
		96,
		true
	},
	child_mind_processing_title = {
		824865,
		100,
		true
	},
	child_mind_time_title = {
		824965,
		100,
		true
	},
	child_collect_lock = {
		825065,
		93,
		true
	},
	child_nature_title = {
		825158,
		91,
		true
	},
	child_btn_review = {
		825249,
		92,
		true
	},
	child_schedule_empty_tip = {
		825341,
		121,
		true
	},
	child_schedule_event_tip = {
		825462,
		128,
		true
	},
	child_schedule_sure_tip = {
		825590,
		169,
		true
	},
	child_schedule_sure_tip2 = {
		825759,
		152,
		true
	},
	child_plan_check_tip1 = {
		825911,
		140,
		true
	},
	child_plan_check_tip2 = {
		826051,
		112,
		true
	},
	child_plan_check_tip3 = {
		826163,
		118,
		true
	},
	child_plan_check_tip4 = {
		826281,
		109,
		true
	},
	child_plan_check_tip5 = {
		826390,
		109,
		true
	},
	child_plan_event = {
		826499,
		92,
		true
	},
	child_btn_home = {
		826591,
		84,
		true
	},
	child_option_limit = {
		826675,
		88,
		true
	},
	child_shop_tip1 = {
		826763,
		111,
		true
	},
	child_shop_tip2 = {
		826874,
		115,
		true
	},
	child_filter_title = {
		826989,
		88,
		true
	},
	child_filter_type1 = {
		827077,
		94,
		true
	},
	child_filter_type2 = {
		827171,
		94,
		true
	},
	child_filter_type3 = {
		827265,
		94,
		true
	},
	child_plan_type1 = {
		827359,
		92,
		true
	},
	child_plan_type2 = {
		827451,
		92,
		true
	},
	child_plan_type3 = {
		827543,
		92,
		true
	},
	child_plan_type4 = {
		827635,
		92,
		true
	},
	child_filter_award_res = {
		827727,
		92,
		true
	},
	child_filter_award_nature = {
		827819,
		95,
		true
	},
	child_filter_award_attr1 = {
		827914,
		94,
		true
	},
	child_filter_award_attr2 = {
		828008,
		94,
		true
	},
	child_mood_desc1 = {
		828102,
		155,
		true
	},
	child_mood_desc2 = {
		828257,
		155,
		true
	},
	child_mood_desc3 = {
		828412,
		157,
		true
	},
	child_mood_desc4 = {
		828569,
		155,
		true
	},
	child_mood_desc5 = {
		828724,
		155,
		true
	},
	child_stage_desc1 = {
		828879,
		93,
		true
	},
	child_stage_desc2 = {
		828972,
		93,
		true
	},
	child_stage_desc3 = {
		829065,
		93,
		true
	},
	child_default_callname = {
		829158,
		95,
		true
	},
	flagship_display_mode_1 = {
		829253,
		111,
		true
	},
	flagship_display_mode_2 = {
		829364,
		111,
		true
	},
	flagship_display_mode_3 = {
		829475,
		96,
		true
	},
	flagship_educate_slot_lock_tip = {
		829571,
		199,
		true
	},
	child_story_name = {
		829770,
		89,
		true
	},
	secretary_special_name = {
		829859,
		98,
		true
	},
	secretary_special_lock_tip = {
		829957,
		130,
		true
	},
	secretary_special_title_age = {
		830087,
		109,
		true
	},
	secretary_special_title_physiognomy = {
		830196,
		117,
		true
	},
	child_plan_skip = {
		830313,
		97,
		true
	},
	child_attr_name1 = {
		830410,
		86,
		true
	},
	child_attr_name2 = {
		830496,
		86,
		true
	},
	child_task_system_type2 = {
		830582,
		93,
		true
	},
	child_task_system_type3 = {
		830675,
		93,
		true
	},
	child_plan_perform_title = {
		830768,
		100,
		true
	},
	child_date_text1 = {
		830868,
		92,
		true
	},
	child_date_text2 = {
		830960,
		92,
		true
	},
	child_date_text3 = {
		831052,
		92,
		true
	},
	child_date_text4 = {
		831144,
		92,
		true
	},
	child_upgrade_sure_tip = {
		831236,
		214,
		true
	},
	child_school_sure_tip = {
		831450,
		194,
		true
	},
	child_extraAttr_sure_tip = {
		831644,
		140,
		true
	},
	child_reset_sure_tip = {
		831784,
		187,
		true
	},
	child_end_sure_tip = {
		831971,
		106,
		true
	},
	child_buff_name = {
		832077,
		85,
		true
	},
	child_unlock_tip = {
		832162,
		86,
		true
	},
	child_unlock_out = {
		832248,
		86,
		true
	},
	child_unlock_memory = {
		832334,
		89,
		true
	},
	child_unlock_polaroid = {
		832423,
		91,
		true
	},
	child_unlock_ending = {
		832514,
		89,
		true
	},
	child_unlock_intimacy = {
		832603,
		94,
		true
	},
	child_unlock_buff = {
		832697,
		87,
		true
	},
	child_unlock_attr2 = {
		832784,
		88,
		true
	},
	child_unlock_attr3 = {
		832872,
		88,
		true
	},
	child_unlock_bag = {
		832960,
		86,
		true
	},
	child_shop_empty_tip = {
		833046,
		119,
		true
	},
	child_bag_empty_tip = {
		833165,
		109,
		true
	},
	levelscene_deploy_submarine = {
		833274,
		103,
		true
	},
	levelscene_deploy_submarine_cancel = {
		833377,
		110,
		true
	},
	levelscene_airexpel_cancel = {
		833487,
		102,
		true
	},
	levelscene_airexpel_select_enemy = {
		833589,
		133,
		true
	},
	levelscene_airexpel_outrange = {
		833722,
		122,
		true
	},
	levelscene_airexpel_select_boss = {
		833844,
		132,
		true
	},
	levelscene_airexpel_select_battle = {
		833976,
		156,
		true
	},
	levelscene_airexpel_select_confirm_left = {
		834132,
		203,
		true
	},
	levelscene_airexpel_select_confirm_right = {
		834335,
		204,
		true
	},
	levelscene_airexpel_select_confirm_up = {
		834539,
		201,
		true
	},
	levelscene_airexpel_select_confirm_down = {
		834740,
		203,
		true
	},
	shipyard_phase_1 = {
		834943,
		712,
		true
	},
	shipyard_phase_2 = {
		835655,
		86,
		true
	},
	shipyard_button_1 = {
		835741,
		93,
		true
	},
	shipyard_button_2 = {
		835834,
		137,
		true
	},
	shipyard_introduce = {
		835971,
		219,
		true
	},
	help_supportfleet = {
		836190,
		358,
		true
	},
	word_status_inSupportFleet = {
		836548,
		105,
		true
	},
	ship_formationMediator_request_replace_support = {
		836653,
		205,
		true
	},
	courtyard_label_train = {
		836858,
		91,
		true
	},
	courtyard_label_rest = {
		836949,
		90,
		true
	},
	courtyard_label_capacity = {
		837039,
		94,
		true
	},
	courtyard_label_share = {
		837133,
		91,
		true
	},
	courtyard_label_shop = {
		837224,
		90,
		true
	},
	courtyard_label_decoration = {
		837314,
		96,
		true
	},
	courtyard_label_template = {
		837410,
		94,
		true
	},
	courtyard_label_floor = {
		837504,
		98,
		true
	},
	courtyard_label_exp_addition = {
		837602,
		105,
		true
	},
	courtyard_label_total_exp_addition = {
		837707,
		117,
		true
	},
	courtyard_label_comfortable_addition = {
		837824,
		125,
		true
	},
	courtyard_label_placed_furniture = {
		837949,
		111,
		true
	},
	courtyard_label_shop_1 = {
		838060,
		98,
		true
	},
	courtyard_label_clear = {
		838158,
		91,
		true
	},
	courtyard_label_save = {
		838249,
		90,
		true
	},
	courtyard_label_save_theme = {
		838339,
		102,
		true
	},
	courtyard_label_using = {
		838441,
		97,
		true
	},
	courtyard_label_search_holder = {
		838538,
		105,
		true
	},
	courtyard_label_filter = {
		838643,
		92,
		true
	},
	courtyard_label_time = {
		838735,
		90,
		true
	},
	courtyard_label_week = {
		838825,
		93,
		true
	},
	courtyard_label_month = {
		838918,
		94,
		true
	},
	courtyard_label_year = {
		839012,
		93,
		true
	},
	courtyard_label_putlist_title = {
		839105,
		114,
		true
	},
	courtyard_label_custom_theme = {
		839219,
		107,
		true
	},
	courtyard_label_system_theme = {
		839326,
		104,
		true
	},
	courtyard_tip_furniture_not_in_layer = {
		839430,
		124,
		true
	},
	courtyard_label_detail = {
		839554,
		92,
		true
	},
	courtyard_label_place_pnekey = {
		839646,
		104,
		true
	},
	courtyard_label_delete = {
		839750,
		92,
		true
	},
	courtyard_label_cancel_share = {
		839842,
		104,
		true
	},
	courtyard_label_empty_template_list = {
		839946,
		139,
		true
	},
	courtyard_label_empty_custom_template_list = {
		840085,
		195,
		true
	},
	courtyard_label_empty_collection_list = {
		840280,
		135,
		true
	},
	courtyard_label_go = {
		840415,
		88,
		true
	},
	mot_class_t_level_1 = {
		840503,
		92,
		true
	},
	mot_class_t_level_2 = {
		840595,
		95,
		true
	},
	equip_share_label_1 = {
		840690,
		95,
		true
	},
	equip_share_label_2 = {
		840785,
		95,
		true
	},
	equip_share_label_3 = {
		840880,
		95,
		true
	},
	equip_share_label_4 = {
		840975,
		95,
		true
	},
	equip_share_label_5 = {
		841070,
		95,
		true
	},
	equip_share_label_6 = {
		841165,
		95,
		true
	},
	equip_share_label_7 = {
		841260,
		95,
		true
	},
	equip_share_label_8 = {
		841355,
		95,
		true
	},
	equip_share_label_9 = {
		841450,
		95,
		true
	},
	equipcode_input = {
		841545,
		97,
		true
	},
	equipcode_slot_unmatch = {
		841642,
		138,
		true
	},
	equipcode_share_nolabel = {
		841780,
		133,
		true
	},
	equipcode_share_exceedlimit = {
		841913,
		127,
		true
	},
	equipcode_illegal = {
		842040,
		102,
		true
	},
	equipcode_confirm_doublecheck = {
		842142,
		133,
		true
	},
	equipcode_import_success = {
		842275,
		106,
		true
	},
	equipcode_share_success = {
		842381,
		111,
		true
	},
	equipcode_like_limited = {
		842492,
		125,
		true
	},
	equipcode_like_success = {
		842617,
		98,
		true
	},
	equipcode_dislike_success = {
		842715,
		101,
		true
	},
	equipcode_report_type_1 = {
		842816,
		105,
		true
	},
	equipcode_report_type_2 = {
		842921,
		105,
		true
	},
	equipcode_report_warning = {
		843026,
		147,
		true
	},
	equipcode_level_unmatched = {
		843173,
		101,
		true
	},
	equipcode_equipment_unowned = {
		843274,
		100,
		true
	},
	equipcode_diff_selected = {
		843374,
		99,
		true
	},
	equipcode_export_success = {
		843473,
		109,
		true
	},
	equipcode_unsaved_tips = {
		843582,
		135,
		true
	},
	equipcode_share_ruletips = {
		843717,
		155,
		true
	},
	equipcode_share_errorcode7 = {
		843872,
		136,
		true
	},
	equipcode_share_errorcode44 = {
		844008,
		140,
		true
	},
	equipcode_share_title = {
		844148,
		97,
		true
	},
	equipcode_share_titleeng = {
		844245,
		98,
		true
	},
	equipcode_share_listempty = {
		844343,
		107,
		true
	},
	equipcode_equip_occupied = {
		844450,
		97,
		true
	},
	sail_boat_equip_tip_1 = {
		844547,
		199,
		true
	},
	sail_boat_equip_tip_2 = {
		844746,
		199,
		true
	},
	sail_boat_equip_tip_3 = {
		844945,
		199,
		true
	},
	sail_boat_equip_tip_4 = {
		845144,
		184,
		true
	},
	sail_boat_equip_tip_5 = {
		845328,
		169,
		true
	},
	sail_boat_minigame_help = {
		845497,
		356,
		true
	},
	pirate_wanted_help = {
		845853,
		376,
		true
	},
	harbor_backhill_help = {
		846229,
		939,
		true
	},
	cryptolalia_download_task_already_exists = {
		847168,
		127,
		true
	},
	charge_scene_buy_confirm_backyard = {
		847295,
		172,
		true
	},
	roll_room1 = {
		847467,
		89,
		true
	},
	roll_room2 = {
		847556,
		80,
		true
	},
	roll_room3 = {
		847636,
		83,
		true
	},
	roll_room4 = {
		847719,
		80,
		true
	},
	roll_room5 = {
		847799,
		83,
		true
	},
	roll_room6 = {
		847882,
		83,
		true
	},
	roll_room7 = {
		847965,
		80,
		true
	},
	roll_room8 = {
		848045,
		80,
		true
	},
	roll_room9 = {
		848125,
		83,
		true
	},
	roll_room10 = {
		848208,
		84,
		true
	},
	roll_room11 = {
		848292,
		81,
		true
	},
	roll_room12 = {
		848373,
		84,
		true
	},
	roll_room13 = {
		848457,
		81,
		true
	},
	roll_room14 = {
		848538,
		81,
		true
	},
	roll_room15 = {
		848619,
		81,
		true
	},
	roll_room16 = {
		848700,
		81,
		true
	},
	roll_room17 = {
		848781,
		84,
		true
	},
	roll_attr_list = {
		848865,
		631,
		true
	},
	roll_notimes = {
		849496,
		115,
		true
	},
	roll_tip2 = {
		849611,
		124,
		true
	},
	roll_reward_word1 = {
		849735,
		87,
		true
	},
	roll_reward_word2 = {
		849822,
		90,
		true
	},
	roll_reward_word3 = {
		849912,
		90,
		true
	},
	roll_reward_word4 = {
		850002,
		90,
		true
	},
	roll_reward_word5 = {
		850092,
		90,
		true
	},
	roll_reward_word6 = {
		850182,
		90,
		true
	},
	roll_reward_word7 = {
		850272,
		90,
		true
	},
	roll_reward_word8 = {
		850362,
		87,
		true
	},
	roll_reward_tip = {
		850449,
		93,
		true
	},
	roll_unlock = {
		850542,
		159,
		true
	},
	roll_noname = {
		850701,
		93,
		true
	},
	roll_card_info = {
		850794,
		90,
		true
	},
	roll_card_attr = {
		850884,
		84,
		true
	},
	roll_card_skill = {
		850968,
		85,
		true
	},
	roll_times_left = {
		851053,
		94,
		true
	},
	roll_room_unexplored = {
		851147,
		87,
		true
	},
	roll_reward_got = {
		851234,
		88,
		true
	},
	roll_gametip = {
		851322,
		1177,
		true
	},
	roll_ending_tip1 = {
		852499,
		139,
		true
	},
	roll_ending_tip2 = {
		852638,
		142,
		true
	},
	commandercat_label_raw_name = {
		852780,
		103,
		true
	},
	commandercat_label_custom_name = {
		852883,
		109,
		true
	},
	commandercat_label_display_name = {
		852992,
		110,
		true
	},
	commander_selected_max = {
		853102,
		112,
		true
	},
	word_talent = {
		853214,
		81,
		true
	},
	word_click_to_close = {
		853295,
		101,
		true
	},
	commander_subtile_ablity = {
		853396,
		100,
		true
	},
	commander_subtile_talent = {
		853496,
		100,
		true
	},
	commander_confirm_tip = {
		853596,
		128,
		true
	},
	commander_level_up_tip = {
		853724,
		128,
		true
	},
	commander_skill_effect = {
		853852,
		98,
		true
	},
	commander_choice_talent_1 = {
		853950,
		125,
		true
	},
	commander_choice_talent_2 = {
		854075,
		104,
		true
	},
	commander_choice_talent_3 = {
		854179,
		132,
		true
	},
	commander_get_box_tip_1 = {
		854311,
		98,
		true
	},
	commander_get_box_tip = {
		854409,
		139,
		true
	},
	commander_total_gold = {
		854548,
		99,
		true
	},
	commander_use_box_tip = {
		854647,
		97,
		true
	},
	commander_use_box_queue = {
		854744,
		99,
		true
	},
	commander_command_ability = {
		854843,
		101,
		true
	},
	commander_logistics_ability = {
		854944,
		103,
		true
	},
	commander_tactical_ability = {
		855047,
		102,
		true
	},
	commander_choice_talent_4 = {
		855149,
		133,
		true
	},
	commander_rename_tip = {
		855282,
		138,
		true
	},
	commander_home_level_label = {
		855420,
		102,
		true
	},
	commander_get_commander_coptyright = {
		855522,
		125,
		true
	},
	commander_choice_talent_reset = {
		855647,
		202,
		true
	},
	commander_lock_setting_title = {
		855849,
		159,
		true
	},
	skin_exchange_confirm = {
		856008,
		160,
		true
	},
	skin_purchase_confirm = {
		856168,
		231,
		true
	},
	blackfriday_pack_lock = {
		856399,
		112,
		true
	},
	skin_exchange_title = {
		856511,
		98,
		true
	},
	blackfriday_pack_select_skinall = {
		856609,
		213,
		true
	},
	skin_discount_desc = {
		856822,
		124,
		true
	},
	skin_exchange_timelimit = {
		856946,
		172,
		true
	},
	blackfriday_pack_purchased = {
		857118,
		99,
		true
	},
	commander_unsel_lock_flag_tip = {
		857217,
		190,
		true
	},
	skin_discount_timelimit = {
		857407,
		155,
		true
	},
	shan_luan_task_progress_tip = {
		857562,
		104,
		true
	},
	shan_luan_task_level_tip = {
		857666,
		104,
		true
	},
	shan_luan_task_help = {
		857770,
		551,
		true
	},
	shan_luan_task_buff_default = {
		858321,
		100,
		true
	},
	senran_pt_consume_tip = {
		858421,
		204,
		true
	},
	senran_pt_not_enough = {
		858625,
		122,
		true
	},
	senran_pt_help = {
		858747,
		472,
		true
	},
	senran_pt_rank = {
		859219,
		95,
		true
	},
	senran_pt_words_feiniao = {
		859314,
		368,
		true
	},
	senran_pt_words_banjiu = {
		859682,
		423,
		true
	},
	senran_pt_words_yan = {
		860105,
		439,
		true
	},
	senran_pt_words_xuequan = {
		860544,
		415,
		true
	},
	senran_pt_words_xuebugui = {
		860959,
		422,
		true
	},
	senran_pt_words_zi = {
		861381,
		371,
		true
	},
	senran_pt_words_xishao = {
		861752,
		378,
		true
	},
	senrankagura_backhill_help = {
		862130,
		1007,
		true
	},
	dorm3d_furnitrue_type_wallpaper = {
		863137,
		101,
		true
	},
	dorm3d_furnitrue_type_floor = {
		863238,
		97,
		true
	},
	dorm3d_furnitrue_type_decoration = {
		863335,
		102,
		true
	},
	dorm3d_furnitrue_type_bed = {
		863437,
		92,
		true
	},
	dorm3d_furnitrue_type_couch = {
		863529,
		97,
		true
	},
	dorm3d_furnitrue_type_table = {
		863626,
		97,
		true
	},
	vote_lable_not_start = {
		863723,
		93,
		true
	},
	vote_lable_voting = {
		863816,
		90,
		true
	},
	vote_lable_title = {
		863906,
		155,
		true
	},
	vote_lable_acc_title_1 = {
		864061,
		98,
		true
	},
	vote_lable_acc_title_2 = {
		864159,
		105,
		true
	},
	vote_lable_curr_title_1 = {
		864264,
		99,
		true
	},
	vote_lable_curr_title_2 = {
		864363,
		106,
		true
	},
	vote_lable_window_title = {
		864469,
		99,
		true
	},
	vote_lable_rearch = {
		864568,
		90,
		true
	},
	vote_lable_daily_task_title = {
		864658,
		103,
		true
	},
	vote_lable_daily_task_tip = {
		864761,
		124,
		true
	},
	vote_lable_task_title = {
		864885,
		97,
		true
	},
	vote_lable_task_list_is_empty = {
		864982,
		123,
		true
	},
	vote_lable_ship_votes = {
		865105,
		90,
		true
	},
	vote_help_2023 = {
		865195,
		4707,
		true
	},
	vote_tip_level_limit = {
		869902,
		160,
		true
	},
	vote_label_rank = {
		870062,
		85,
		true
	},
	vote_label_rank_fresh_time_tip = {
		870147,
		127,
		true
	},
	vote_tip_area_closed = {
		870274,
		117,
		true
	},
	commander_skill_ui_info = {
		870391,
		93,
		true
	},
	commander_skill_ui_confirm = {
		870484,
		96,
		true
	},
	commander_formation_prefab_fleet = {
		870580,
		111,
		true
	},
	rect_ship_card_tpl_add = {
		870691,
		98,
		true
	},
	newyear2024_backhill_help = {
		870789,
		455,
		true
	},
	last_times_sign = {
		871244,
		102,
		true
	},
	skin_page_sign = {
		871346,
		90,
		true
	},
	skin_page_desc = {
		871436,
		181,
		true
	},
	live2d_reset_desc = {
		871617,
		102,
		true
	},
	skin_exchange_usetip = {
		871719,
		144,
		true
	},
	blackfriday_pack_select_skinall_dialog = {
		871863,
		230,
		true
	},
	not_use_ticket_to_buy_skin = {
		872093,
		114,
		true
	},
	skin_purchase_over_price = {
		872207,
		277,
		true
	},
	help_chunjie2024 = {
		872484,
		980,
		true
	},
	child_random_polaroid_drop = {
		873464,
		96,
		true
	},
	child_random_ops_drop = {
		873560,
		97,
		true
	},
	child_refresh_sure_tip = {
		873657,
		119,
		true
	},
	child_target_set_sure_tip = {
		873776,
		231,
		true
	},
	child_polaroid_lock_tip = {
		874007,
		117,
		true
	},
	child_task_finish_all = {
		874124,
		118,
		true
	},
	child_unlock_new_secretary = {
		874242,
		172,
		true
	},
	child_no_resource = {
		874414,
		96,
		true
	},
	child_target_set_empty = {
		874510,
		104,
		true
	},
	child_target_set_skip = {
		874614,
		136,
		true
	},
	child_news_import_empty = {
		874750,
		111,
		true
	},
	child_news_other_empty = {
		874861,
		110,
		true
	},
	word_week_day1 = {
		874971,
		87,
		true
	},
	word_week_day2 = {
		875058,
		87,
		true
	},
	word_week_day3 = {
		875145,
		87,
		true
	},
	word_week_day4 = {
		875232,
		87,
		true
	},
	word_week_day5 = {
		875319,
		87,
		true
	},
	word_week_day6 = {
		875406,
		87,
		true
	},
	word_week_day7 = {
		875493,
		87,
		true
	},
	child_shop_price_title = {
		875580,
		95,
		true
	},
	child_callname_tip = {
		875675,
		94,
		true
	},
	child_plan_no_cost = {
		875769,
		95,
		true
	},
	word_emoji_unlock = {
		875864,
		96,
		true
	},
	word_get_emoji = {
		875960,
		86,
		true
	},
	word_show_extra_reward_at_fudai_dialog = {
		876046,
		141,
		true
	},
	skin_shop_buy_confirm = {
		876187,
		157,
		true
	},
	activity_victory = {
		876344,
		113,
		true
	},
	other_world_temple_toggle_1 = {
		876457,
		103,
		true
	},
	other_world_temple_toggle_2 = {
		876560,
		103,
		true
	},
	other_world_temple_toggle_3 = {
		876663,
		103,
		true
	},
	other_world_temple_char = {
		876766,
		102,
		true
	},
	other_world_temple_award = {
		876868,
		100,
		true
	},
	other_world_temple_got = {
		876968,
		95,
		true
	},
	other_world_temple_progress = {
		877063,
		119,
		true
	},
	other_world_temple_char_title = {
		877182,
		108,
		true
	},
	other_world_temple_award_last = {
		877290,
		104,
		true
	},
	other_world_temple_award_title_1 = {
		877394,
		117,
		true
	},
	other_world_temple_award_title_2 = {
		877511,
		117,
		true
	},
	other_world_temple_award_title_3 = {
		877628,
		117,
		true
	},
	other_world_temple_lottery_all = {
		877745,
		115,
		true
	},
	other_world_temple_award_desc = {
		877860,
		190,
		true
	},
	temple_consume_not_enough = {
		878050,
		101,
		true
	},
	other_world_temple_pay = {
		878151,
		97,
		true
	},
	other_world_task_type_daily = {
		878248,
		103,
		true
	},
	other_world_task_type_main = {
		878351,
		102,
		true
	},
	other_world_task_type_repeat = {
		878453,
		104,
		true
	},
	other_world_task_title = {
		878557,
		101,
		true
	},
	other_world_task_get_all = {
		878658,
		100,
		true
	},
	other_world_task_go = {
		878758,
		89,
		true
	},
	other_world_task_got = {
		878847,
		93,
		true
	},
	other_world_task_get = {
		878940,
		90,
		true
	},
	other_world_task_tag_main = {
		879030,
		95,
		true
	},
	other_world_task_tag_daily = {
		879125,
		96,
		true
	},
	other_world_task_tag_all = {
		879221,
		94,
		true
	},
	terminal_personal_title = {
		879315,
		99,
		true
	},
	terminal_adventure_title = {
		879414,
		100,
		true
	},
	terminal_guardian_title = {
		879514,
		96,
		true
	},
	personal_info_title = {
		879610,
		95,
		true
	},
	personal_property_title = {
		879705,
		93,
		true
	},
	personal_ability_title = {
		879798,
		92,
		true
	},
	adventure_award_title = {
		879890,
		103,
		true
	},
	adventure_progress_title = {
		879993,
		109,
		true
	},
	adventure_lv_title = {
		880102,
		97,
		true
	},
	adventure_record_title = {
		880199,
		98,
		true
	},
	adventure_record_grade_title = {
		880297,
		110,
		true
	},
	adventure_award_end_tip = {
		880407,
		121,
		true
	},
	guardian_select_title = {
		880528,
		100,
		true
	},
	guardian_sure_btn = {
		880628,
		87,
		true
	},
	guardian_cancel_btn = {
		880715,
		89,
		true
	},
	guardian_active_tip = {
		880804,
		92,
		true
	},
	personal_random = {
		880896,
		91,
		true
	},
	adventure_get_all = {
		880987,
		93,
		true
	},
	Announcements_Event_Notice = {
		881080,
		102,
		true
	},
	Announcements_System_Notice = {
		881182,
		103,
		true
	},
	Announcements_News = {
		881285,
		94,
		true
	},
	Announcements_Donotshow = {
		881379,
		105,
		true
	},
	adventure_unlock_tip = {
		881484,
		156,
		true
	},
	personal_random_tip = {
		881640,
		134,
		true
	},
	guardian_sure_limit_tip = {
		881774,
		120,
		true
	},
	other_world_temple_tip = {
		881894,
		533,
		true
	},
	otherworld_map_help = {
		882427,
		530,
		true
	},
	otherworld_backhill_help = {
		882957,
		535,
		true
	},
	otherworld_terminal_help = {
		883492,
		535,
		true
	},
	vote_2023_reward_word_1 = {
		884027,
		309,
		true
	},
	vote_2023_reward_word_2 = {
		884336,
		338,
		true
	},
	vote_2023_reward_word_3 = {
		884674,
		322,
		true
	},
	voting_page_reward = {
		884996,
		94,
		true
	},
	idol3rd_houshan = {
		885090,
		1031,
		true
	},
	idol3rd_collection = {
		886121,
		675,
		true
	},
	idol3rd_practice = {
		886796,
		927,
		true
	},
	dorm3d_furniture_window_acesses = {
		887723,
		107,
		true
	},
	dorm3d_furniture_count = {
		887830,
		97,
		true
	},
	dorm3d_furniture_used = {
		887927,
		119,
		true
	},
	dorm3d_furniture_unfit = {
		888046,
		98,
		true
	},
	dorm3d_waiting = {
		888144,
		90,
		true
	},
	dorm3d_daily_favor = {
		888234,
		103,
		true
	},
	dorm3d_favor_level = {
		888337,
		106,
		true
	},
	dorm3d_time_choose = {
		888443,
		94,
		true
	},
	dorm3d_now_time = {
		888537,
		91,
		true
	},
	dorm3d_is_auto_time = {
		888628,
		116,
		true
	},
	dorm3d_clothing_choose = {
		888744,
		98,
		true
	},
	dorm3d_now_clothing = {
		888842,
		89,
		true
	},
	dorm3d_talk = {
		888931,
		81,
		true
	},
	dorm3d_touch = {
		889012,
		82,
		true
	},
	dorm3d_gift = {
		889094,
		81,
		true
	},
	dorm3d_gift_owner_num = {
		889175,
		94,
		true
	}
}
