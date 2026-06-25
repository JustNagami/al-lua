return {
	id = "DORM3DVIDEO2101",
	mode = 2,
	shipGroup = 79902,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "ん……電波、ヨシ…角度も、ヨシ……これで……",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone1/dorm3d_nakhimov_telephone1",
			options = {
				{
					content = "ナヒーモフ？",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "anger_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_amazed_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "あれ、指揮官……通話がもう始まっている？",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone2/dorm3d_nakhimov_telephone2",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "Idle",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "あ…この時間だと、指揮官の仕事を邪魔してない……？",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone3/dorm3d_nakhimov_telephone3",
			options = {
				{
					content = "ナヒーモフの声が聞きたかったから大丈夫",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "excited_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_amazed_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "ならよかった……さっき端末のビデオ通話機能を調整してた",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone4/dorm3d_nakhimov_telephone4",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "emotion_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "本当は後で、指揮官の仕事を邪魔しない時間に掛けようと思ってたのに",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone5/dorm3d_nakhimov_telephone5",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "talk_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_shame_start",
							type = "action"
						},
						{
							skip = false,
							time = 1,
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
			say = "うっかりケーブルが端末をタッチしてしまって……",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone6/dorm3d_nakhimov_telephone6",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "shy_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "その……通話するまで、端末の置き場所とか色々考えてた",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone7/dorm3d_nakhimov_telephone7",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "shake_01",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_think_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "どこに置けば一番きれいに映るか、とか……繋がったら何を話そうか、とか……",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone8/dorm3d_nakhimov_telephone8"
		},
		{
			say = "前に指揮官が点検を頼んでた設備の話をしようとも考えたけど",
			wait = 2,
			voice = "event:/dorm/dorm3d_nakhimov_telephone9/dorm3d_nakhimov_telephone9",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "stare_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "もう直ったし、これ以上広げようがなくて",
			wait = 2,
			voice = "event:/dorm/dorm3d_nakhimov_telephone10/dorm3d_nakhimov_telephone10",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "anger_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_happy_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "だからいっそ、まだ分からないことがあるフリをして……そうすればちょっとは長く話せるかなって……",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone11/dorm3d_nakhimov_telephone11",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "think_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "内容以外にも……どんな姿勢で、どんな顔で話せば……とか……",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone12/dorm3d_nakhimov_telephone12",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "shake_01",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "いざ繋がったら……全部忘れた……",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone13/dorm3d_nakhimov_telephone13",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "sad_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_shy_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "うっ……こういうのって思ったよりも難しいね。変に緊張するし",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone14/dorm3d_nakhimov_telephone14",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "talk_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_think_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "画面越しなのに、なんだか実際に向き合う時よりも……ドキドキして",
			wait = 2,
			voice = "event:/dorm/dorm3d_nakhimov_telephone15/dorm3d_nakhimov_telephone15",
			options = {
				{
					content = "今のその照れてる姿も十分可愛いよ",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "Idle",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_think_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "そ、そう？……じゃあ次からはもう準備しないよ",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_nakhimov_telephone16/dorm3d_nakhimov_telephone16",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "Idle",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_think_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "指揮官も……いつでもどこでも、ナヒーモフに電話をかけて",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_nakhimov_telephone17/dorm3d_nakhimov_telephone17",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "talk_02-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_happy_start",
							type = "action"
						},
						{
							skip = false,
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
			say = "ナヒーモフ、ずっと待ってるから",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_nakhimov_telephone18/dorm3d_nakhimov_telephone18",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "anger_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_shy_start",
							type = "action"
						},
						{
							skip = false,
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
		}
	}
}
