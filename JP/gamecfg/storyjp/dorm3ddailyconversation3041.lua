return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION3041",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			actorName = "19903",
			side = 2,
			say = "おんせん、きもちいい！せんせー、おんせん、いこう！",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							skip = true,
							name = "ab_shuohua_gandong_01",
							type = "action"
						},
						{
							skip = true,
							name = "Face_kaixin",
							type = "action"
						},
						{
							time = 1.5,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		},
		{
			actorName = "19903",
			side = 2,
			say = "じかん、だいじょうぶ！……おんせん、いつでも、だいじょうぶ！",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = "19903",
			side = 2,
			say = "ぽかぽか、いいきもち……そとのおんせん、おほしさま、みれる！",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = "19903",
			side = 2,
			say = "せんせー、アンカレッジに、おほしさまおしえて……なつの、だいさんかく、ほっきょくせい！",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							skip = true,
							name = "ab_shuohua_idle_02",
							type = "action"
						},
						{
							skip = true,
							name = "Face_weixiao",
							type = "action"
						},
						{
							time = 1.5,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		},
		{
			actorName = "19903",
			side = 2,
			say = "アンカレッジと、いっしょ！えへへ",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
