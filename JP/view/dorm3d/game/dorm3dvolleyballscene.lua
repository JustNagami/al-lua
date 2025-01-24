local var_0_0 = class("Dorm3dVolleyballScene", import("view.dorm3d.Game.Dorm3dGameTemplate"))
local var_0_1 = "ui-dorm_countdown"
local var_0_2 = "ui-dorm_qte_appear"
local var_0_3 = "ui-dorm_qte_hit"
local var_0_4 = "ui-dorm_qte_citical"
local var_0_5 = "ui-dorm_qte_miss"
local var_0_6 = "ui-dorm_scoring"
local var_0_7 = "ui-dorm_victory"
local var_0_8 = "ui-dorm_pop_up"

var_0_0.QTE_RESULT = {
	MISS = "Miss",
	PERFECT = "Critical",
	HIT = "Hit"
}
var_0_0.ROUND_RESULT = {
	OUR_WIN = 1,
	OTHER_WIN = 2
}
var_0_0.GAME_RESULT = {
	VICTORY = 1,
	DEFEAT = 2
}
var_0_0.hitRadiusMax = 231
var_0_0.hitRadiusMin = 50
var_0_0.perfectRadiusMax = 139
var_0_0.perfectRadiusMin = 85
var_0_0.perfectScaleRandoms = {
	0.7,
	1.7
}
var_0_0.triggerRadius = 255
var_0_0.endScore = 6
var_0_0.BallInitPos = Vector3(22, 4.5, -22.4)
var_0_0.BallSpeed = 0.1
var_0_0.BallQTESpeed = 0.01
var_0_0.BallRandomDelat = {
	Top = 300,
	Bottom = 300,
	Left = 300,
	Right = 300
}

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dVolleyballUI"
end

function var_0_0.forceGC(arg_2_0)
	return true
end

function var_0_0.loadingQueue(arg_3_0)
	return function(arg_4_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_5_0)
			return arg_4_0(arg_5_0)
		end)
	end
end

function var_0_0.lowerAdpter(arg_6_0)
	return true
end

local var_0_9

function var_0_0.Ctor(arg_7_0, ...)
	var_0_0.super.Ctor(arg_7_0, ...)

	arg_7_0.loader = AutoLoader.New()
end

function var_0_0.preload(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.contextData.groupId

	arg_8_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_8_0))

	arg_8_0.volleyballCfg = pg.dorm3d_volleyball[var_8_0]
	arg_8_0.sceneRootName = "beach"
	arg_8_0.sceneName = "map_beach_01"
	arg_8_0.timelineSceneRootName = pg.dorm3d_dorm_template[var_8_0].asset_name
	arg_8_0.timelineSceneName = string.lower(arg_8_0.volleyballCfg.scene_name)

	seriesAsync({
		function(arg_9_0)
			pg.UIMgr.GetInstance():LoadingOn(false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. arg_8_0.sceneRootName .. "/" .. arg_8_0.sceneName .. "_scene"), arg_8_0.sceneName, LoadSceneMode.Additive, function(arg_10_0, arg_10_1)
				arg_8_0:InitGameParam()
				SceneManager.SetActiveScene(arg_10_0)
				onNextTick(arg_9_0)
			end)
		end,
		function(arg_11_0)
			local var_11_0 = arg_8_0.timelineSceneRootName
			local var_11_1 = arg_8_0.timelineSceneName

			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_11_0 .. "/timeline/" .. var_11_1 .. "/" .. var_11_1 .. "_scene"), var_11_1, LoadSceneMode.Additive, function(arg_12_0, arg_12_1)
				arg_11_0()
			end)
		end,
		function(arg_13_0)
			pg.UIMgr.GetInstance():LoadingOff()
			arg_13_0()
		end,
		arg_8_1
	})
end

function var_0_0.InitGameParam(arg_14_0)
	var_0_0.BallSpeed = arg_14_0.volleyballCfg.BallSpeedParam[1]
	var_0_0.BallQTESpeed = arg_14_0.volleyballCfg.BallSpeedParam[2]
	var_0_0.endScore = arg_14_0.volleyballCfg.endScore
end

function var_0_0.init(arg_15_0)
	arg_15_0:initUI()
	arg_15_0:initScene()
	arg_15_0:BindEvent()
end

function var_0_0.initUI(arg_16_0)
	arg_16_0.skipUI = arg_16_0._tf:Find("SkipUI")

	setActive(arg_16_0.skipUI, false)

	arg_16_0.gameUI = arg_16_0._tf:Find("GameUI")

	setText(arg_16_0.gameUI:Find("Title/Text"), i18n("dorm3d_volleyball_title"))

	arg_16_0.ourScoreTF = arg_16_0.gameUI:Find("Score/Content/Left")
	arg_16_0.otherScoreTF = arg_16_0.gameUI:Find("Score/Content/Right")
	arg_16_0.qteTF = arg_16_0.gameUI:Find("QTE")
	arg_16_0.qteTriggerTF = arg_16_0.gameUI:Find("QTE/animroot/Trigger")

	setActive(arg_16_0.qteTF, false)
	setActive(arg_16_0.gameUI, false)

	arg_16_0.scoreUI = arg_16_0._tf:Find("ScoreUI")

	setActive(arg_16_0.scoreUI, false)

	arg_16_0.endUI = arg_16_0._tf:Find("EndUI")

	setActive(arg_16_0.endUI, false)

	arg_16_0.resultUI = arg_16_0._tf:Find("ResultUI")

	setActive(arg_16_0.resultUI, false)
	setText(arg_16_0.resultUI:Find("AgainBtn/Text"), i18n("dorm3d_minigame_again"))
	setText(arg_16_0.resultUI:Find("CloseBtn/Text"), i18n("dorm3d_minigame_close"))

	local var_16_0 = arg_16_0._tf:Find("Debug")

	setActive(var_16_0, false)

	arg_16_0.debugTimelineName = var_16_0:Find("Timeline"):GetComponent(typeof(Text))
	arg_16_0.debugTrackName = var_16_0:Find("Track"):GetComponent(typeof(Text))
end

function var_0_0.BindEvent(arg_17_0)
	onButton(arg_17_0, arg_17_0.gameUI:Find("Title/BackBtn"), function()
		arg_17_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_17_0, arg_17_0.gameUI, function()
		if not arg_17_0.startQTEUI then
			return
		end

		arg_17_0:EndQTE()
	end)
	onButton(arg_17_0, arg_17_0.skipUI:Find("SkipBtn"), function()
		setActive(arg_17_0.skipUI, false)
		arg_17_0:StopPlayingTimeline()
		arg_17_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.endUI, function()
		arg_17_0:emit(Dorm3dGameMediatorTemplate.TRIGGER_FAVOR, arg_17_0.apartment.configId)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.resultUI:Find("AgainBtn"), function()
		setActive(arg_17_0.resultUI, false)
		arg_17_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.resultUI:Find("CloseBtn"), function()
		arg_17_0:closeView()
	end, SFX_CANCEL)
end

function var_0_0.initScene(arg_24_0)
	local var_24_0 = SceneManager.GetSceneByName(arg_24_0.sceneName):GetRootGameObjects()

	table.IpairsCArray(var_24_0, function(arg_25_0, arg_25_1)
		if arg_25_1.name == "[MainBlock]" then
			arg_24_0.modelRoot = tf(arg_25_1):Find("[Model]/scene_root")
			arg_24_0.ballTF = arg_24_0.modelRoot:Find("fbx/litmap05/pre_db_sportinggoods03")
			arg_24_0.ballTF.position = var_0_0.BallInitPos

			setActive(arg_24_0.ballTF, false)
		elseif arg_25_1.name == "MainCamera" then
			arg_24_0.mainCamera = arg_25_1.transform

			setActive(arg_24_0.mainCamera, false)
		elseif arg_25_1.name == "PlayerCamera" then
			arg_24_0.ballCamera = arg_25_1.transform
			arg_24_0.ballCameraComp = arg_24_0.ballCamera:GetComponent(typeof(Camera))

			setActive(arg_24_0.ballCamera, false)
		elseif arg_25_1.name == "TriggerPlane" then
			setActive(arg_25_1, false)

			local var_25_0 = tf(arg_25_1):Find("BallCreate")
			local var_25_1 = var_25_0:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_24_0.ballCreatePlane = Plane.New(var_25_1.normals[0], -Vector3.Dot(var_25_0.position, var_25_1.normals[0]))

			local var_25_2 = tf(arg_25_1):Find("BallQte")

			setLocalPosition(var_25_2, Vector3(arg_24_0.volleyballCfg.BallQtePlane[1][1], arg_24_0.volleyballCfg.BallQtePlane[1][2], arg_24_0.volleyballCfg.BallQtePlane[1][3]))
			setLocalEulerAngles(var_25_2, Vector3(arg_24_0.volleyballCfg.BallQtePlane[2][1], arg_24_0.volleyballCfg.BallQtePlane[2][2], arg_24_0.volleyballCfg.BallQtePlane[2][3]))

			local var_25_3 = var_25_2:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_24_0.ballQtePlane = Plane.New(var_25_3.normals[0], -Vector3.Dot(var_25_2.position, var_25_3.normals[0]))

			local var_25_4 = tf(arg_25_1):Find("BallMiss")

			setLocalPosition(var_25_4, Vector3(arg_24_0.volleyballCfg.BallMissPlane[1][1], arg_24_0.volleyballCfg.BallMissPlane[1][2], arg_24_0.volleyballCfg.BallMissPlane[1][3]))
			setLocalEulerAngles(var_25_4, Vector3(arg_24_0.volleyballCfg.BallMissPlane[2][1], arg_24_0.volleyballCfg.BallMissPlane[2][2], arg_24_0.volleyballCfg.BallMissPlane[2][3]))

			local var_25_5 = var_25_4:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_24_0.ballMissPlane = Plane.New(var_25_5.normals[0], -Vector3.Dot(var_25_4.position, var_25_5.normals[0]))
		end
	end)
	arg_24_0:InitLightSettings()

	local var_24_1 = SceneManager.GetSceneByName(arg_24_0.timelineSceneName):GetRootGameObjects()

	arg_24_0.totalDirectorList = {}

	table.IpairsCArray(var_24_1, function(arg_26_0, arg_26_1)
		local var_26_0 = tf(arg_26_1):Find("[sequence]")

		if IsNil(var_26_0) then
			return
		end

		local var_26_1 = var_26_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		var_26_1.playOnAwake = false

		local var_26_2 = var_26_0:GetComponentsInChildren(typeof(UnityEngine.Playables.PlayableDirector))

		for iter_26_0 = 0, var_26_2.Length - 1 do
			var_26_2[iter_26_0].playOnAwake = false
		end

		table.insert(arg_24_0.totalDirectorList, {
			name = arg_26_1.name,
			director = var_26_1
		})
		setActive(arg_26_1, false)
	end)
end

function var_0_0.InitLightSettings(arg_27_0)
	arg_27_0.globalVolume = GameObject.Find("GlobalVolume")
	arg_27_0.characterLight = GameObject.Find("CharacterLight")

	local var_27_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_27_0:GetComponentsInChildren(typeof(Light)), function(arg_28_0, arg_28_1)
		arg_28_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.didEnter(arg_29_0)
	arg_29_0:InitData()
	setActive(arg_29_0.skipUI, true)
	arg_29_0:PlayTimeline({
		name = arg_29_0:GetWeightTimeline("jinchang")
	}, function()
		if not arg_29_0.playingFlag then
			setActive(arg_29_0.skipUI, false)
			arg_29_0:StartGame()
		end
	end)
end

function var_0_0.InitData(arg_31_0)
	return
end

function var_0_0.PlayTimeline(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0:StopPlayingTimeline()

	local var_32_0 = {}
	local var_32_1 = arg_32_1.name
	local var_32_2 = arg_32_1.track
	local var_32_3 = _.detect(arg_32_0.totalDirectorList, function(arg_33_0)
		return arg_33_0.name == var_32_1
	end)

	assert(var_32_3, "Missing director " .. var_32_1)

	if not var_32_3 then
		existCall(arg_32_2)

		return
	end

	arg_32_0.playingDirector = var_32_3.director

	local var_32_4 = arg_32_0.playingDirector.transform

	arg_32_0.debugTimelineName.text = var_32_4.parent.name

	table.insert(var_32_0, function(arg_34_0)
		if arg_32_1.time then
			arg_32_0.playingDirector.time = math.clamp(arg_32_1.time, 0, arg_32_0.playingDirector.duration)
		end

		TimelineSupport.InitTimeline(arg_32_0.playingDirector)

		local var_34_0 = {}

		GetOrAddComponent(var_32_4, "DftCommonSignalReceiver"):SetCommonEvent(function(arg_35_0)
			switch(arg_35_0.stringParameter, {
				TimelineRandomTrack = function()
					arg_32_0:DoTimelineRandomTrack(arg_32_0.playingDirector)
				end,
				TimelineLoop = function()
					arg_32_0.playingDirector.time = arg_35_0.floatParameter
				end,
				TimelineEnd = function()
					var_34_0.finish = true

					arg_32_0.playingDirector:Stop()
					setActive(tf(arg_32_0.playingDirector).parent, false)
				end
			}, function()
				warning("other event trigger:" .. arg_35_0.stringParameter)
			end)

			if var_34_0.finish then
				arg_32_0.timelineMark = var_34_0
				arg_32_0.debugTimelineName.text = ""
				arg_32_0.debugTrackName.text = ""

				arg_34_0()
			end
		end)
		arg_32_0.playingDirector:Evaluate()
		arg_32_0:DoTimelineRandomTrack(arg_32_0.playingDirector)
		setActive(tf(arg_32_0.playingDirector).parent, true)
		arg_32_0.playingDirector:Play()
		setActive(arg_32_0.mainCamera, false)

		if arg_32_0.activeDirectorInfo then
			arg_32_0.lastDirectorInfo = arg_32_0.activeDirectorInfo
		end

		arg_32_0.activeDirectorInfo = var_32_3
	end)
	seriesAsync(var_32_0, function()
		setActive(arg_32_0.mainCamera, true)

		arg_32_0.playingDirector = nil

		local var_40_0 = arg_32_0.timelineMark

		arg_32_0.timelineMark = nil

		existCall(arg_32_2, var_40_0)
	end)
end

function var_0_0.StopPlayingTimeline(arg_41_0)
	if arg_41_0.playingDirector then
		arg_41_0.playingDirector:Stop()
		setActive(tf(arg_41_0.playingDirector).parent, false)

		arg_41_0.debugTimelineName.text = ""
		arg_41_0.debugTrackName.text = ""

		setActive(arg_41_0.mainCamera, true)
	end
end

function var_0_0.StartGame(arg_42_0)
	setActive(arg_42_0.mainCamera, true)

	arg_42_0.playingFlag = true
	arg_42_0.gameResult = nil
	arg_42_0.ourScore, arg_42_0.otherScore = 0, 0

	setActive(arg_42_0.gameUI, true)
	setActive(arg_42_0.gameUI:Find("Score"), false)

	local var_42_0 = arg_42_0.gameUI:Find("Count")

	setActive(var_42_0, true)

	local var_42_1 = var_42_0:GetComponent(typeof(DftAniEvent))

	var_42_1:SetEndEvent(function()
		setActive(var_42_0, false)
		arg_42_0:StartOneRound()
		setActive(arg_42_0.gameUI:Find("Score"), true)
		var_42_1:SetEndEvent(nil)
	end)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_1)
end

function var_0_0.UpdateGameScore(arg_44_0)
	setText(arg_44_0.ourScoreTF, arg_44_0.ourScore)
	setText(arg_44_0.otherScoreTF, arg_44_0.otherScore)
end

function var_0_0.UpdateScoreTpl(arg_45_0, arg_45_1)
	setText(arg_45_1:Find("Left/Tens/Text"), 0)
	setText(arg_45_1:Find("Left/Units/Text"), arg_45_0.ourScore % 10)
	setText(arg_45_1:Find("Right/Tens/Text"), 0)
	setText(arg_45_1:Find("Right/Units/Text"), arg_45_0.otherScore % 10)
end

function var_0_0.StartOneRound(arg_46_0)
	arg_46_0:UpdateGameScore()

	arg_46_0.roundEndFlag = false
	arg_46_0.roundResult = nil

	seriesAsync({
		function(arg_47_0)
			arg_46_0:FaQiuOP(arg_47_0)
		end,
		function(arg_48_0)
			arg_46_0:OneQTE()
		end
	})
end

function var_0_0.OneQTE(arg_49_0)
	seriesAsync({
		function(arg_50_0)
			arg_49_0:StartQTE(arg_50_0)
		end,
		function(arg_51_0)
			switch(arg_49_0.qteResult, {
				[var_0_0.QTE_RESULT.MISS] = function()
					arg_49_0:QteMissOP(function()
						arg_49_0.roundEndFlag = true
						arg_49_0.roundResult = var_0_0.ROUND_RESULT.OTHER_WIN

						arg_51_0()
					end)
				end,
				[var_0_0.QTE_RESULT.HIT] = function()
					arg_49_0:QteHitOP(arg_51_0)
				end,
				[var_0_0.QTE_RESULT.PERFECT] = function()
					arg_49_0:QtePerfectOP(function()
						arg_49_0.roundEndFlag = true
						arg_49_0.roundResult = var_0_0.ROUND_RESULT.OUR_WIN

						arg_51_0()
					end)
				end
			}, function()
				assert(false, "unknow qte result" .. arg_49_0.qteResult)
			end)
		end
	}, function()
		if not arg_49_0.roundEndFlag then
			arg_49_0:OneQTE()
		else
			arg_49_0:EndOneRound()
		end
	end)
end

function var_0_0.EndOneRound(arg_59_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_6)

	local var_59_0 = arg_59_0.scoreUI:GetComponent(typeof(DftAniEvent))

	var_59_0:SetEndEvent(function()
		quickPlayAnimation(arg_59_0.scoreUI, "Anim_Dorm3d_volleyball_score_out")
		onDelayTick(function()
			setActive(arg_59_0.scoreUI, false)
		end, 0.1)

		if arg_59_0:CheckEndGame() then
			arg_59_0:EndGame()
		else
			setActive(arg_59_0.gameUI, true)
			arg_59_0:StartOneRound()
		end

		var_59_0:SetEndEvent(nil)
	end)
	setActive(arg_59_0.gameUI, false)
	arg_59_0:UpdateScoreTpl(arg_59_0.scoreUI:Find("ScoreTpl"))
	setText(arg_59_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_59_0.ourScore % 10)
	setText(arg_59_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_59_0.otherScore % 10)
	switch(arg_59_0.roundResult, {
		[var_0_0.ROUND_RESULT.OUR_WIN] = function()
			arg_59_0.ourScore = arg_59_0.ourScore + 1

			setText(arg_59_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_59_0.ourScore % 10)
			setActive(arg_59_0.scoreUI, true)
			quickPlayAnimation(arg_59_0.scoreUI, "Anim_Dorm3d_volleyball_score_leftin")
		end,
		[var_0_0.ROUND_RESULT.OTHER_WIN] = function()
			arg_59_0.otherScore = arg_59_0.otherScore + 1

			setText(arg_59_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_59_0.otherScore % 10)
			setActive(arg_59_0.scoreUI, true)
			quickPlayAnimation(arg_59_0.scoreUI, "Anim_Dorm3d_volleyball_score_rightin")
		end
	}, function()
		assert(false, "unknow round result" .. arg_59_0.roundResult)
	end)
end

function var_0_0.CheckEndGame(arg_65_0)
	if arg_65_0.ourScore >= var_0_0.endScore then
		arg_65_0.gameResult = var_0_0.GAME_RESULT.VICTORY

		return true
	end

	if arg_65_0.otherScore >= var_0_0.endScore then
		arg_65_0.gameResult = var_0_0.GAME_RESULT.DEFEAT

		return true
	end

	return false
end

function var_0_0.EndGame(arg_66_0)
	if arg_66_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
		pg.CriMgr.GetInstance():PlaySE_V3(var_0_7)
	end

	seriesAsync({
		function(arg_67_0)
			local var_67_0 = arg_66_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "shibai" or "shengli"

			arg_66_0:PlayTimeline({
				name = arg_66_0:GetWeightTimeline(var_67_0)
			}, arg_67_0)
		end
	}, function()
		arg_66_0:PlayTimeline({
			name = arg_66_0:GetWeightTimeline("daiji")
		}, function()
			return
		end)
		setActive(arg_66_0.endUI, true)
		setActive(arg_66_0.endUI:Find("Title/Victory"), arg_66_0.gameResult == var_0_0.GAME_RESULT.VICTORY)
		setActive(arg_66_0.endUI:Find("Title/Defeat"), arg_66_0.gameResult == var_0_0.GAME_RESULT.DEFEAT)
		arg_66_0:UpdateScoreTpl(arg_66_0.endUI:Find("ScoreTpl"))
	end)
end

function var_0_0.ShowResultUI(arg_70_0, arg_70_1)
	(function()
		local var_71_0 = arg_70_0.contextData.roomId
		local var_71_1 = arg_70_0.contextData.groupId
		local var_71_2 = arg_70_0.contextData.groupIds or {
			var_71_1
		}
		local var_71_3 = table.concat(var_71_2, ",")
		local var_71_4 = arg_70_0.ourScore .. ":" .. arg_70_0.otherScore

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataRoom(var_71_0, 8, var_71_3, var_71_4))
	end)()
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_8)
	seriesAsync({
		function(arg_72_0)
			quickPlayAnimation(arg_70_0.endUI, "Anim_Dorm3d_volleyball_end_out")
			onDelayTick(function()
				setActive(arg_70_0.endUI, false)
			end, 0.1)

			if arg_70_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
				arg_70_0:PlayTimeline({
					name = arg_70_0:GetWeightTimeline("jiangli")
				}, arg_72_0)
			else
				arg_70_0:StopPlayingTimeline()
				arg_72_0()
			end
		end
	}, function()
		gcAll(true)
		setActive(arg_70_0.resultUI, true)

		local var_74_0

		var_74_0 = arg_70_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "Victory" or "Defeat"

		setText(arg_70_0.resultUI:Find("Panel/Text"), i18n("volleyball_end_tip", arg_70_0.apartment:getConfig("name")))

		if arg_70_1 and arg_70_1.cost > 0 then
			setActive(arg_70_0.resultUI:Find("Panel/Award"), true)
			setText(arg_70_0.resultUI:Find("Panel/Award/Text"), i18n("volleyball_end_award", arg_70_0.apartment:getConfig("name")))
		else
			setActive(arg_70_0.resultUI:Find("Panel/Award"), false)
		end
	end)
end

function var_0_0.FaQiuOP(arg_75_0, arg_75_1)
	arg_75_0:PlayTimeline({
		name = arg_75_0:GetWeightTimeline("faqiu")
	}, arg_75_1)
end

function var_0_0.StartQTE(arg_76_0, arg_76_1)
	arg_76_0.qteCallback = arg_76_1

	setActive(arg_76_0.ballCamera, true)
	setActive(arg_76_0.mainCamera, false)

	arg_76_0.randomScreenPos = Vector2(math.random(var_0_0.BallRandomDelat.Left, Screen.width - var_0_0.BallRandomDelat.Right), math.random(var_0_0.BallRandomDelat.Bottom, Screen.height - var_0_0.BallRandomDelat.Top))

	local var_76_0 = arg_76_0.ballCameraComp:ScreenPointToRay(arg_76_0.randomScreenPos)

	arg_76_0.randomScale = math.random(var_0_0.perfectScaleRandoms[1] * 10, arg_76_0.perfectScaleRandoms[2] * 10) / 10

	local var_76_1 = (var_0_0.perfectRadiusMax + var_0_0.perfectRadiusMin) / 2 * arg_76_0.randomScale / var_0_0.triggerRadius
	local var_76_2 = arg_76_0.ballQtePlane.distance + (arg_76_0.ballMissPlane.distance - arg_76_0.ballQtePlane.distance) * (1 - var_76_1)
	local var_76_3, var_76_4 = Plane.New(arg_76_0.ballQtePlane.normal, var_76_2):Raycast(var_76_0)

	assert(var_76_3, "retPerfect plane not in view")

	arg_76_0.ballDir = (var_76_0:GetPoint(var_76_4) - var_0_0.BallInitPos):Normalize()

	local var_76_5 = Ray.New(arg_76_0.ballDir, var_0_0.BallInitPos)
	local var_76_6, var_76_7 = arg_76_0.ballQtePlane:Raycast(var_76_5)

	assert(var_76_6, "qte plane not in view")

	local var_76_8 = var_76_5:GetPoint(var_76_7)
	local var_76_9, var_76_10 = arg_76_0.ballMissPlane:Raycast(var_76_5)

	assert(var_76_9, "miss plane not in view")

	local var_76_11 = var_76_5:GetPoint(var_76_10)
	local var_76_12 = 0

	arg_76_0.qteUITime = (var_76_8 - var_76_11):Magnitude() / var_0_0.BallQTESpeed
	arg_76_0.ballTimer = Timer.New(function()
		if var_76_12 >= var_76_10 then
			arg_76_0.ballTimer:Stop()

			arg_76_0.ballTimer = nil

			setActive(arg_76_0.ballTF, false)

			arg_76_0.ballTF.position = var_0_0.BallInitPos

			if arg_76_0.startQTEUI then
				setLocalScale(arg_76_0.qteTriggerTF, {
					x = 0,
					y = 0
				})
				arg_76_0:EndQTE(var_0_0.QTE_RESULT.MISS)
			end
		elseif var_76_12 >= var_76_7 then
			var_76_12 = var_76_12 + var_0_0.BallQTESpeed
			arg_76_0.ballTF.position = var_76_5:GetPoint(var_76_12)

			if not arg_76_0.startQTEUI then
				arg_76_0:StartQTEUI()
			end

			arg_76_0.curScale = arg_76_0.curScale - 1 / arg_76_0.qteUITime

			setLocalScale(arg_76_0.qteTriggerTF, {
				x = arg_76_0.curScale,
				y = arg_76_0.curScale
			})

			arg_76_0.curRadius = var_0_0.triggerRadius * arg_76_0.curScale

			if arg_76_0.curScale < 0 then
				arg_76_0:EndQTE()
			end
		else
			var_76_12 = var_76_12 + var_0_0.BallSpeed
			arg_76_0.ballTF.position = var_76_5:GetPoint(var_76_12)
		end
	end, 0.016666666666666666, -1)

	setActive(arg_76_0.ballTF, true)
	arg_76_0.ballTimer:Start()
end

function var_0_0.StartQTEUI(arg_78_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_2)
	setLocalScale(arg_78_0.qteTriggerTF, {
		x = 1,
		y = 1
	})
	eachChild(arg_78_0.qteTF:Find("animroot/Result"), function(arg_79_0)
		setActive(arg_79_0, false)
	end)

	arg_78_0.qteResult = nil
	arg_78_0.curRadius = var_0_0.triggerRadius
	arg_78_0.curPerfectRadiusMax = var_0_0.perfectRadiusMax * arg_78_0.randomScale
	arg_78_0.curPerfectRadiusMin = var_0_0.perfectRadiusMin * arg_78_0.randomScale

	setLocalScale(arg_78_0.qteTF:Find("animroot/Perfect"), {
		x = arg_78_0.randomScale,
		y = arg_78_0.randomScale
	})

	arg_78_0.curScale = 1

	setLocalPosition(arg_78_0.qteTF, LuaHelper.ScreenToLocal(arg_78_0.qteTF.parent, arg_78_0.randomScreenPos, pg.UIMgr.GetInstance().uiCameraComp))
	setActive(arg_78_0.qteTF, true)

	arg_78_0.startQTEUI = true
end

function var_0_0.EndQTE(arg_80_0, arg_80_1)
	arg_80_0.startQTEUI = nil

	setActive(arg_80_0.mainCamera, true)
	setActive(arg_80_0.ballCamera, false)

	if arg_80_1 then
		arg_80_0.qteResult = arg_80_1
	elseif arg_80_0.curRadius < var_0_0.hitRadiusMin or arg_80_0.curRadius > var_0_0.hitRadiusMax then
		arg_80_0.qteResult = var_0_0.QTE_RESULT.MISS
	elseif arg_80_0.curRadius <= arg_80_0.curPerfectRadiusMax and arg_80_0.curRadius >= arg_80_0.curPerfectRadiusMin then
		arg_80_0.qteResult = var_0_0.QTE_RESULT.PERFECT
	else
		arg_80_0.qteResult = var_0_0.QTE_RESULT.HIT
	end

	eachChild(arg_80_0.qteTF:Find("animroot/Result"), function(arg_81_0)
		setActive(arg_81_0, arg_81_0.name == arg_80_0.qteResult)
	end)

	if arg_80_0.ballTimer then
		arg_80_0.ballTimer:Stop()

		arg_80_0.ballTimer = nil

		setActive(arg_80_0.ballTF, false)

		arg_80_0.ballTF.position = var_0_0.BallInitPos
	end

	if arg_80_0.qteCallback then
		arg_80_0.qteCallback()

		arg_80_0.qteCallback = nil
	end

	onDelayTick(function()
		setActive(arg_80_0.qteTF, false)
	end, 1)
end

function var_0_0.QteMissOP(arg_83_0, arg_83_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_5)
	arg_83_0:PlayTimeline({
		name = arg_83_0:GetWeightTimeline("shiqiu")
	}, arg_83_1)
end

function var_0_0.QteHitOP(arg_84_0, arg_84_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_3)
	seriesAsync({
		function(arg_85_0)
			arg_84_0:PlayTimeline({
				name = arg_84_0:GetWeightTimeline("fly")
			}, arg_85_0)
		end,
		function(arg_86_0)
			arg_84_0:PlayTimeline({
				name = arg_84_0:GetWeightTimeline("jieqiu")
			}, arg_86_0)
		end
	}, arg_84_1)
end

function var_0_0.QtePerfectOP(arg_87_0, arg_87_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_4)
	seriesAsync({
		function(arg_88_0)
			arg_87_0:PlayTimeline({
				name = arg_87_0:GetWeightTimeline("max_fly")
			}, arg_88_0)
		end,
		function(arg_89_0)
			arg_87_0:PlayTimeline({
				name = arg_87_0:GetWeightTimeline("shouji")
			}, arg_89_0)
		end
	}, arg_87_1)
end

function var_0_0.GetWeightTimeline(arg_90_0, arg_90_1)
	local var_90_0 = arg_90_0.volleyballCfg[arg_90_1]

	assert(var_90_0 ~= "", "volleyball cfg is empty string" .. arg_90_1)
	assert(#var_90_0 ~= 0, "volleyball cfg is empty table:" .. arg_90_1)

	local var_90_1 = underscore.reduce(var_90_0, 0, function(arg_91_0, arg_91_1)
		return arg_91_0 + arg_91_1[2]
	end)
	local var_90_2 = math.random() * var_90_1
	local var_90_3 = 0

	for iter_90_0, iter_90_1 in ipairs(var_90_0) do
		var_90_3 = var_90_3 + iter_90_1[2]

		if var_90_2 <= var_90_3 then
			return iter_90_1[1]
		end
	end
end

function var_0_0.DoTimelineRandomTrack(arg_92_0, arg_92_1)
	local var_92_0 = {}
	local var_92_1 = TimelineHelper.GetTimelineTracks(arg_92_1)

	for iter_92_0 = 0, var_92_1.Length - 1 do
		local var_92_2 = var_92_1[iter_92_0]

		if var_92_2.name ~= "Markers" then
			var_92_2.muted = true

			table.insert(var_92_0, var_92_2)
		end
	end

	if #var_92_0 > 0 then
		local var_92_3 = var_92_0[math.random(#var_92_0)]

		underscore.each(var_92_0, function(arg_93_0)
			if arg_93_0.name == var_92_3.name then
				arg_93_0.muted = false
			end
		end)

		arg_92_0.debugTrackName.text = var_92_3.name
	else
		arg_92_0.debugTrackName.text = "track cnt 0"
	end
end

function var_0_0.OnPause(arg_94_0)
	if arg_94_0.ballTimer then
		arg_94_0.ballTimer:Stop()
	end

	if arg_94_0.playingDirector then
		arg_94_0.playingDirector:Pause()
	end
end

function var_0_0.OnResume(arg_95_0)
	if arg_95_0.ballTimer then
		arg_95_0.ballTimer:Start()
	end

	if arg_95_0.playingDirector then
		arg_95_0.playingDirector:Play()
	end
end

function var_0_0.onBackPressed(arg_96_0)
	if not arg_96_0.playingFlag or isActive(arg_96_0.gameUI:Find("Count")) or isActive(arg_96_0.endUI) then
		return
	end

	arg_96_0:OnPause()
	pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_MSGBOX, {
		contentText = i18n("sure_exit_volleyball"),
		onConfirm = function()
			arg_96_0:emit(var_0_0.ON_BACK)
		end,
		onClose = function()
			arg_96_0:OnResume()
		end
	})
end

function var_0_0.willExit(arg_99_0)
	arg_99_0.loader:Clear()

	if arg_99_0.ballTimer then
		arg_99_0.ballTimer:Stop()

		arg_99_0.ballTimer = nil
	end

	local var_99_0 = {
		{
			path = string.lower("dorm3d/character/" .. arg_99_0.timelineSceneRootName .. "/timeline/" .. arg_99_0.timelineSceneName .. "/" .. arg_99_0.timelineSceneName .. "_scene"),
			name = arg_99_0.timelineSceneName
		},
		{
			path = string.lower("dorm3d/scenesres/scenes/common/" .. arg_99_0.sceneRootName .. "/" .. arg_99_0.sceneName .. "_scene"),
			name = arg_99_0.sceneName
		}
	}
	local var_99_1 = underscore.map(var_99_0, function(arg_100_0)
		return function(arg_101_0)
			SceneOpMgr.Inst:UnloadSceneAsync(arg_100_0.path, arg_100_0.name, arg_101_0)
		end
	end)

	seriesAsync(var_99_1, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

return var_0_0
