return {
	id = "YICHANGDERICHANGDUANJUQING1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			expression = 2,
			side = 2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			actor = 202381,
			say = "指揮官さん、私の羽衣が見つからないの……どこかで見かけなかったかしら？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "一緒に探そう",
					flag = 1
				},
				{
					content = "見てないな……",
					flag = 2
				}
			}
		},
		{
			actor = 202381,
			nameColor = "#A9F548FF",
			side = 2,
			hidePaintObj = true,
			dir = 1,
			optionFlag = 1,
			NextIcon = 1,
			say = "ええ、とても助かるわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 202381,
			nameColor = "#A9F548FF",
			side = 2,
			hidePaintObj = true,
			dir = 1,
			optionFlag = 1,
			NextIcon = 1,
			say = "ありがとう、指揮官さん♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			NextIcon = 1,
			dir = 1,
			optionFlag = 2,
			actor = 202381,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そう……とても大切な宝物なの。どこかで野ざらしになってるのは少し危ないわね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 202381,
			nameColor = "#A9F548FF",
			side = 2,
			hidePaintObj = true,
			dir = 1,
			optionFlag = 2,
			NextIcon = 1,
			say = "もう一度探してみるわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
