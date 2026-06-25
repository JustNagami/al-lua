return {
	id = "DORM3DVIDEO2102",
	mode = 2,
	shipGroup = 79902,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "うん、接続が安定してて……応答遅延も基準範囲内……",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone19/dorm3d_nakhimov_telephone19",
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
			say = "指揮官……ええと、今通信設備の保守点検をしてるところ",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone20/dorm3d_nakhimov_telephone20",
			options = {
				{
					content = "テストのために連絡したってこと？",
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
			say = "そうだけど…でもテスト対象に指揮官を選んだのは、システムによる最適解でもあったから",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone21/dorm3d_nakhimov_telephone21",
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
			say = "音声・映像の送受信確認ヨシ。これより位置特定モジュールの性能テストに移行……",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone22/dorm3d_nakhimov_telephone22",
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
			say = "……ん？データによると座標が完全一致、距離……ゼロメートル？！",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone23/dorm3d_nakhimov_telephone23",
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
			say = "指揮官、そこを動かないで。信号のキャリブレーションを……",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone24/dorm3d_nakhimov_telephone24",
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
			say = "うーん……さっきと変わらない",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone25/dorm3d_nakhimov_telephone25",
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
			say = "きっとモジュールが故障してる……す、すぐにトラブルシューティングに入る……",
			wait = 2,
			voice = "event:/dorm/dorm3d_nakhimov_telephone26/dorm3d_nakhimov_telephone26",
			options = {
				{
					content = "設備のトラブルじゃないかも",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "amazed_01-start",
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
			say = "設備のトラブルじゃない？じゃあ指揮官の座標はどうして……ひょっとして……",
			wait = 2,
			voice = "event:/dorm/dorm3d_nakhimov_telephone27/dorm3d_nakhimov_telephone27",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "scared_01-start",
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
			say = "んん！？ま、まさか！",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone28/dorm3d_nakhimov_telephone28",
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
			say = "もしかしなくても……指揮官は今ドアの外にいるの？ど、どうして？",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone29/dorm3d_nakhimov_telephone29",
			options = {
				{
					content = "会いたくて来ちゃった",
					flag = 1
				}
			},
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
			say = "んにゃ……指揮官ずるい……こんなシチュエーション、テスト計画になかったのに……",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone30/dorm3d_nakhimov_telephone30",
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
			say = "でも……ナヒーモフも指揮官に会いたかった…",
			wait = 1,
			voice = "event:/dorm/dorm3d_nakhimov_telephone31/dorm3d_nakhimov_telephone31",
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
			say = "こうして急に保守点検の話をしたのも……指揮官と話したくなっただけで……",
			wait = 2,
			voice = "event:/dorm/dorm3d_nakhimov_telephone32/dorm3d_nakhimov_telephone32",
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
			say = "まさか指揮官から来てくれるなんて……嬉しい……どんな精密機器を直せた時よりも嬉しい……",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_nakhimov_telephone33/dorm3d_nakhimov_telephone33",
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
			say = "あっ。待ってて……今ドアを開けるから……",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_nakhimov_telephone34/dorm3d_nakhimov_telephone34",
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
			say = "だ、大好き……指揮官……にゃ〜♡",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_nakhimov_telephone35/dorm3d_nakhimov_telephone35",
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
