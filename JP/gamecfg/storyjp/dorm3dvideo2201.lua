return {
	id = "DORM3DVIDEO2201",
	mode = 2,
	shipGroup = 20707,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "指揮官、少しよろしいかしら？",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone1/dorm3d_implacable_telephone1",
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
							name = "Face_smile_start",
							type = "action"
						},
						{
							skip = false,
							time = 3,
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
			say = "さっき指揮官のために祈りを捧げてた時、ふと気づいたことがあって",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone2/dorm3d_implacable_telephone2",
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
							name = "Face_amazed_start",
							type = "action"
						},
						{
							skip = false,
							time = 3,
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
			say = "実は最近、ちょっとした煮込み料理に挑戦してるんだけど……",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone3/dorm3d_implacable_telephone3",
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
							name = "Face_think_start",
							type = "action"
						},
						{
							skip = false,
							time = 3,
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
			say = "一人分でいいはずなのに、ついつい作りすぎてしまうの",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone4/dorm3d_implacable_telephone4",
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
							name = "Face_common",
							type = "action"
						},
						{
							skip = false,
							time = 3,
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
			say = "それで……もしよければ……",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone5/dorm3d_implacable_telephone5",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "pray_01-start",
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
			say = "この贅沢すぎる罪を、たまには一緒に引き受けてくれないかしら？",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone6/dorm3d_implacable_telephone6",
			options = {
				{
					content = "煮込み料理？美味しそうだな",
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
							name = "Face_common",
							type = "action"
						},
						{
							skip = false,
							time = 3,
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
			say = "ふふ……でも味付けにはまだ迷いがあるわ",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone7/dorm3d_implacable_telephone7",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "doubt_01-start",
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
							time = 3,
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
			say = "恥ずかしながら、指揮官の好みについてまだそれほど詳しくなくて",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone8/dorm3d_implacable_telephone8"
		},
		{
			say = "あっさり目が好きかしら？それとも、濃い目がいいかしら？",
			wait = 2,
			voice = "event:/dorm/dorm3d_implacable_telephone9/dorm3d_implacable_telephone9",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "hello_01-start",
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
							time = 3,
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
			say = "あるいは……特別に用意した、少し「危険」な味を試してみる？……おすすめよ",
			wait = 2,
			voice = "event:/dorm/dorm3d_implacable_telephone10/dorm3d_implacable_telephone10",
			options = {
				{
					content = "どれも捨てがたいな。全部味見しても？",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "happy_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_smile_start",
							type = "action"
						},
						{
							skip = false,
							time = 3,
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
			say = "ふふふ、欲張り屋さんね。そんな欲望に正直なところが胸に響くわ",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone11/dorm3d_implacable_telephone11",
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
							name = "Face_helpless_start",
							type = "action"
						},
						{
							skip = false,
							time = 3,
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
			say = "では今夜、こちらにいらしてくれる？",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone12/dorm3d_implacable_telephone12",
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
							time = 3,
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
			say = "しっかり準備をしておくわ。そして、じっくりゆっくりと……",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone13/dorm3d_implacable_telephone13",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "hug_01-start",
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
							time = 3,
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
			say = "あなたが味わう時の表情や、漏れる吐息のひとつひとつを堪能させてもらうわ",
			wait = 1,
			voice = "event:/dorm/dorm3d_implacable_telephone14/dorm3d_implacable_telephone14",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "answer_01-start",
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
							time = 3,
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
			say = "ロウソクの暖かい光の中で……あなたが本当に求める味を、ゆっくり教えてちょうだい",
			wait = 2,
			voice = "event:/dorm/dorm3d_implacable_telephone15/dorm3d_implacable_telephone15",
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
							name = "Face_shy_start",
							type = "action"
						},
						{
							skip = false,
							time = 3,
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
			say = "香りと囁きに包まれて……",
			wait = 2,
			voice = "event:/dorm/dorm3d_implacable_telephone16/dorm3d_implacable_telephone16",
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
							name = "Face_common",
							type = "action"
						},
						{
							skip = false,
							time = 3,
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
			say = "味覚も心も満たす何かを……一緒に探しましょう？",
			wait = 2,
			voice = "event:/dorm/dorm3d_implacable_telephone17/dorm3d_implacable_telephone17",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "heart_01-start",
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
							time = 3,
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
