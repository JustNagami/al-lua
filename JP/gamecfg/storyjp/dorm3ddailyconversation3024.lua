return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION3024",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			actorName = "19903",
			side = 2,
			say = "せんせー……アンカレッジ……ひみつきち…ほしい！",
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
							name = "ab_shuohua_jidong_01",
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
			say = "だれもしらない……せんせーとアンカレッジのおはなし、いっぱい！",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = "19903",
			side = 2,
			say = "どこがいい？べっどのした……テント…？",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = "19903",
			side = 2,
			say = "うん……おおきいツリーハウス、つくる！",
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
							name = "ab_shuohua_lianxudiantou_01",
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
			say = "アンカレッジとせんせー、ないしょで……なんでもできる！えへへ",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
