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
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. arg_8_0.sceneRootName .. "/" .. arg_8_0.sceneName .. "_scene"), arg_8_0.sceneName, LoadSceneMode.Additive, function(arg_10_0, arg_10_1)
				arg_8_0:InitGameParam()
				SceneManager.SetActiveScene(arg_10_0)
				arg_9_0()
			end)
		end,
		function(arg_11_0)
			local var_11_0 = arg_8_0.timelineSceneRootName
			local var_11_1 = arg_8_0.timelineSceneName

			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_11_0 .. "/timeline/" .. var_11_1 .. "/" .. var_11_1 .. "_scene"), var_11_1, LoadSceneMode.Additive, function(arg_12_0, arg_12_1)
				arg_11_0()
			end)
		end
	}, arg_8_1)
end

function var_0_0.InitGameParam(arg_13_0)
	var_0_0.BallSpeed = arg_13_0.volleyballCfg.BallSpeedParam[1]
	var_0_0.BallQTESpeed = arg_13_0.volleyballCfg.BallSpeedParam[2]
	var_0_0.endScore = arg_13_0.volleyballCfg.endScore
end

function var_0_0.init(arg_14_0)
	arg_14_0:initUI()
	arg_14_0:initScene()
	arg_14_0:BindEvent()
end

function var_0_0.initUI(arg_15_0)
	arg_15_0.skipUI = arg_15_0._tf:Find("SkipUI")

	setActive(arg_15_0.skipUI, false)

	arg_15_0.gameUI = arg_15_0._tf:Find("GameUI")

	setText(arg_15_0.gameUI:Find("Title/Text"), i18n("dorm3d_volleyball_title"))

	arg_15_0.ourScoreTF = arg_15_0.gameUI:Find("Score/Content/Left")
	arg_15_0.otherScoreTF = arg_15_0.gameUI:Find("Score/Content/Right")
	arg_15_0.qteTF = arg_15_0.gameUI:Find("QTE")
	arg_15_0.qteTriggerTF = arg_15_0.gameUI:Find("QTE/animroot/Trigger")

	setActive(arg_15_0.qteTF, false)
	setActive(arg_15_0.gameUI, false)
	arg_15_0.gameUI:Find("Count"):GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		if not arg_15_0.isStartGame then
			return
		end

		arg_15_0.isStartGame = false

		setActive(arg_15_0.gameUI:Find("Count"), false)
		arg_15_0:StartOneRound()
		setActive(arg_15_0.gameUI:Find("Score"), true)
	end)

	arg_15_0.scoreUI = arg_15_0._tf:Find("ScoreUI")

	setActive(arg_15_0.scoreUI, false)

	arg_15_0.endUI = arg_15_0._tf:Find("EndUI")

	setActive(arg_15_0.endUI, false)

	arg_15_0.resultUI = arg_15_0._tf:Find("ResultUI")

	setActive(arg_15_0.resultUI, false)
	setText(arg_15_0.resultUI:Find("AgainBtn/Text"), i18n("dorm3d_minigame_again"))
	setText(arg_15_0.resultUI:Find("CloseBtn/Text"), i18n("dorm3d_minigame_close"))
	arg_15_0.scoreUI:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		if not arg_15_0.isEndOneRound then
			return
		end

		arg_15_0.isEndOneRound = false

		quickPlayAnimation(arg_15_0.scoreUI, "Anim_Dorm3d_volleyball_score_out")
		onDelayTick(function()
			setActive(arg_15_0.scoreUI, false)
		end, 0.1)

		if arg_15_0:CheckEndGame() then
			arg_15_0:EndGame()
		else
			setActive(arg_15_0.gameUI, true)
			arg_15_0:StartOneRound()
		end
	end)

	local var_15_0 = arg_15_0._tf:Find("Debug")

	setActive(var_15_0, false)

	arg_15_0.debugTimelineName = var_15_0:Find("Timeline"):GetComponent(typeof(Text))
	arg_15_0.debugTrackName = var_15_0:Find("Track"):GetComponent(typeof(Text))
end

function var_0_0.BindEvent(arg_19_0)
	onButton(arg_19_0, arg_19_0.gameUI:Find("Title/BackBtn"), function()
		arg_19_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_19_0, arg_19_0.gameUI, function()
		if not arg_19_0.startQTEUI then
			return
		end

		arg_19_0:EndQTE()
	end)
	onButton(arg_19_0, arg_19_0.skipUI:Find("SkipBtn"), function()
		setActive(arg_19_0.skipUI, false)
		arg_19_0:StopPlayingTimeline()
		arg_19_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.endUI, function()
		arg_19_0:emit(Dorm3dGameMediatorTemplate.TRIGGER_FAVOR, arg_19_0.apartment.configId)
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.resultUI:Find("AgainBtn"), function()
		setActive(arg_19_0.resultUI, false)
		arg_19_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.resultUI:Find("CloseBtn"), function()
		arg_19_0:closeView()
	end, SFX_CANCEL)
end

function var_0_0.initScene(arg_26_0)
	local var_26_0 = SceneManager.GetSceneByName(arg_26_0.sceneName):GetRootGameObjects()

	table.IpairsCArray(var_26_0, function(arg_27_0, arg_27_1)
		if arg_27_1.name == "[MainBlock]" then
			arg_26_0.modelRoot = tf(arg_27_1):Find("[Model]/scene_root")
			arg_26_0.ballTF = arg_26_0.modelRoot:Find("fbx/litmap05/pre_db_sportinggoods03")
			arg_26_0.ballTF.position = var_0_0.BallInitPos

			setActive(arg_26_0.ballTF, false)
		elseif arg_27_1.name == "MainCamera" then
			arg_26_0.mainCamera = arg_27_1.transform

			setActive(arg_26_0.mainCamera, false)
		elseif arg_27_1.name == "PlayerCamera" then
			arg_26_0.ballCamera = arg_27_1.transform
			arg_26_0.ballCameraComp = arg_26_0.ballCamera:GetComponent(typeof(Camera))

			setActive(arg_26_0.ballCamera, false)
		elseif arg_27_1.name == "TriggerPlane" then
			setActive(arg_27_1, false)

			local var_27_0 = tf(arg_27_1):Find("BallCreate")
			local var_27_1 = var_27_0:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_26_0.ballCreatePlane = Plane.New(var_27_1.normals[0], -Vector3.Dot(var_27_0.position, var_27_1.normals[0]))

			local var_27_2 = tf(arg_27_1):Find("BallQte")

			setLocalPosition(var_27_2, Vector3(arg_26_0.volleyballCfg.BallQtePlane[1][1], arg_26_0.volleyballCfg.BallQtePlane[1][2], arg_26_0.volleyballCfg.BallQtePlane[1][3]))
			setLocalEulerAngles(var_27_2, Vector3(arg_26_0.volleyballCfg.BallQtePlane[2][1], arg_26_0.volleyballCfg.BallQtePlane[2][2], arg_26_0.volleyballCfg.BallQtePlane[2][3]))

			local var_27_3 = var_27_2:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_26_0.ballQtePlane = Plane.New(var_27_3.normals[0], -Vector3.Dot(var_27_2.position, var_27_3.normals[0]))

			local var_27_4 = tf(arg_27_1):Find("BallMiss")

			setLocalPosition(var_27_4, Vector3(arg_26_0.volleyballCfg.BallMissPlane[1][1], arg_26_0.volleyballCfg.BallMissPlane[1][2], arg_26_0.volleyballCfg.BallMissPlane[1][3]))
			setLocalEulerAngles(var_27_4, Vector3(arg_26_0.volleyballCfg.BallMissPlane[2][1], arg_26_0.volleyballCfg.BallMissPlane[2][2], arg_26_0.volleyballCfg.BallMissPlane[2][3]))

			local var_27_5 = var_27_4:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_26_0.ballMissPlane = Plane.New(var_27_5.normals[0], -Vector3.Dot(var_27_4.position, var_27_5.normals[0]))
		end
	end)
	arg_26_0:InitLightSettings()

	local var_26_1 = SceneManager.GetSceneByName(arg_26_0.timelineSceneName):GetRootGameObjects()

	arg_26_0.totalDirectorList = {}

	local var_26_2 = tolua.createinstance(typeof("BLHX.Rendering.FinalBlit"))

	table.IpairsCArray(var_26_1, function(arg_28_0, arg_28_1)
		local var_28_0 = tf(arg_28_1):Find("[sequence]")

		if IsNil(var_28_0) then
			return
		end

		local var_28_1 = tf(arg_28_1):Find("[camera]/MainCamera"):GetComponent("BLHX.Rendering.BuiltinAdditionalCameraData")

		ReflectionHelp.RefSetField(typeof("BLHX.Rendering.BuiltinAdditionalCameraData"), "m_FinalBlit", var_28_1, var_26_2)

		local var_28_2 = var_28_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		var_28_2.playOnAwake = false

		var_28_2:Stop()

		local var_28_3 = var_28_0:GetComponentsInChildren(typeof(UnityEngine.Playables.PlayableDirector), true)

		for iter_28_0 = 0, var_28_3.Length - 1 do
			var_28_3[iter_28_0].playOnAwake = false

			var_28_3[iter_28_0]:Stop()
		end

		table.insert(arg_26_0.totalDirectorList, {
			name = arg_28_1.name,
			director = var_28_2
		})
		setActive(arg_28_1, false)
	end)
end

function var_0_0.InitLightSettings(arg_29_0)
	arg_29_0.globalVolume = GameObject.Find("GlobalVolume")
	arg_29_0.characterLight = GameObject.Find("CharacterLight")

	local var_29_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_29_0:GetComponentsInChildren(typeof(Light)), function(arg_30_0, arg_30_1)
		arg_30_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.didEnter(arg_31_0)
	arg_31_0:InitData()
	setActive(arg_31_0.skipUI, true)
	arg_31_0:PlayTimeline({
		name = arg_31_0:GetWeightTimeline("jinchang")
	}, function()
		if not arg_31_0.playingFlag then
			setActive(arg_31_0.skipUI, false)
			arg_31_0:StartGame()
		end
	end)
end

function var_0_0.InitData(arg_33_0)
	return
end

function var_0_0.PlayTimeline(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_1.name
	local var_34_1 = arg_34_1.track
	local var_34_2 = _.detect(arg_34_0.totalDirectorList, function(arg_35_0)
		return arg_35_0.name == var_34_0
	end)

	assert(var_34_2, "Missing director " .. var_34_0)
	arg_34_0:StopPlayingTimeline(tobool(var_34_2))

	if not var_34_2 then
		existCall(arg_34_2)

		return
	end

	local var_34_3 = {}

	arg_34_0.playingDirector = var_34_2.director

	local var_34_4 = arg_34_0.playingDirector.transform

	arg_34_0.debugTimelineName.text = var_34_4.parent.name

	table.insert(var_34_3, function(arg_36_0)
		if arg_34_1.time then
			arg_34_0.playingDirector.time = math.clamp(arg_34_1.time, 0, arg_34_0.playingDirector.duration)
		end

		TimelineSupport.InitTimeline(arg_34_0.playingDirector)

		local var_36_0 = {}

		GetOrAddComponent(var_34_4, "DftCommonSignalReceiver"):SetCommonEvent(function(arg_37_0)
			switch(arg_37_0.stringParameter, {
				TimelineRandomTrack = function()
					arg_34_0:DoTimelineRandomTrack(arg_34_0.playingDirector)
				end,
				TimelineLoop = function()
					arg_34_0.playingDirector.time = arg_37_0.floatParameter
				end,
				TimelineEnd = function()
					var_36_0.finish = true

					arg_34_0.playingDirector:Stop()
					setActive(tf(arg_34_0.playingDirector).parent, false)
				end
			}, function()
				warning("other event trigger:" .. arg_37_0.stringParameter)
			end)

			if var_36_0.finish then
				arg_34_0.timelineMark = var_36_0
				arg_34_0.debugTimelineName.text = ""
				arg_34_0.debugTrackName.text = ""

				arg_36_0()
			end
		end)
		arg_34_0.playingDirector:Evaluate()
		arg_34_0:DoTimelineRandomTrack(arg_34_0.playingDirector)
		setActive(tf(arg_34_0.playingDirector).parent, true)
		arg_34_0.playingDirector:Play()
		setActive(arg_34_0.mainCamera, false)

		if arg_34_0.activeDirectorInfo then
			arg_34_0.lastDirectorInfo = arg_34_0.activeDirectorInfo
		end

		arg_34_0.activeDirectorInfo = var_34_2
	end)
	seriesAsync(var_34_3, function()
		setActive(arg_34_0.mainCamera, true)

		arg_34_0.playingDirector = nil

		local var_42_0 = arg_34_0.timelineMark

		arg_34_0.timelineMark = nil

		existCall(arg_34_2, var_42_0)
	end)
end

function var_0_0.StopPlayingTimeline(arg_43_0, arg_43_1)
	if arg_43_0.playingDirector then
		arg_43_0.playingDirector:Stop()
		setActive(tf(arg_43_0.playingDirector).parent, false)

		arg_43_0.debugTimelineName.text = ""
		arg_43_0.debugTrackName.text = ""
		arg_43_0.playingDirector = nil

		if not arg_43_1 then
			setActive(arg_43_0.mainCamera, true)
		end
	end
end

function var_0_0.StartGame(arg_44_0)
	setActive(arg_44_0.mainCamera, true)

	arg_44_0.playingFlag = true
	arg_44_0.gameResult = nil
	arg_44_0.ourScore, arg_44_0.otherScore = 0, 0

	setActive(arg_44_0.gameUI, true)
	setActive(arg_44_0.gameUI:Find("Score"), false)

	local var_44_0 = arg_44_0.gameUI:Find("Count")

	setActive(var_44_0, true)

	arg_44_0.isStartGame = true

	pg.CriMgr.GetInstance():PlaySE_V3(var_0_1)
end

function var_0_0.UpdateGameScore(arg_45_0)
	setText(arg_45_0.ourScoreTF, arg_45_0.ourScore)
	setText(arg_45_0.otherScoreTF, arg_45_0.otherScore)
end

function var_0_0.UpdateScoreTpl(arg_46_0, arg_46_1)
	setText(arg_46_1:Find("Left/Tens/Text"), 0)
	setText(arg_46_1:Find("Left/Units/Text"), arg_46_0.ourScore % 10)
	setText(arg_46_1:Find("Right/Tens/Text"), 0)
	setText(arg_46_1:Find("Right/Units/Text"), arg_46_0.otherScore % 10)
end

function var_0_0.StartOneRound(arg_47_0)
	arg_47_0:UpdateGameScore()

	arg_47_0.roundEndFlag = false
	arg_47_0.roundResult = nil

	seriesAsync({
		function(arg_48_0)
			arg_47_0:FaQiuOP(arg_48_0)
		end,
		function(arg_49_0)
			arg_47_0:OneQTE()
		end
	})
end

function var_0_0.OneQTE(arg_50_0)
	seriesAsync({
		function(arg_51_0)
			arg_50_0:StartQTE(arg_51_0)
		end,
		function(arg_52_0)
			switch(arg_50_0.qteResult, {
				[var_0_0.QTE_RESULT.MISS] = function()
					arg_50_0:QteMissOP(function()
						arg_50_0.roundEndFlag = true
						arg_50_0.roundResult = var_0_0.ROUND_RESULT.OTHER_WIN

						arg_52_0()
					end)
				end,
				[var_0_0.QTE_RESULT.HIT] = function()
					arg_50_0:QteHitOP(arg_52_0)
				end,
				[var_0_0.QTE_RESULT.PERFECT] = function()
					arg_50_0:QtePerfectOP(function()
						arg_50_0.roundEndFlag = true
						arg_50_0.roundResult = var_0_0.ROUND_RESULT.OUR_WIN

						arg_52_0()
					end)
				end
			}, function()
				assert(false, "unknow qte result" .. arg_50_0.qteResult)
			end)
		end
	}, function()
		if not arg_50_0.roundEndFlag then
			arg_50_0:OneQTE()
		else
			arg_50_0:EndOneRound()
		end
	end)
end

function var_0_0.EndOneRound(arg_60_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_6)

	arg_60_0.isEndOneRound = true

	setActive(arg_60_0.gameUI, false)
	arg_60_0:UpdateScoreTpl(arg_60_0.scoreUI:Find("ScoreTpl"))
	setText(arg_60_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_60_0.ourScore % 10)
	setText(arg_60_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_60_0.otherScore % 10)
	switch(arg_60_0.roundResult, {
		[var_0_0.ROUND_RESULT.OUR_WIN] = function()
			arg_60_0.ourScore = arg_60_0.ourScore + 1

			setText(arg_60_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_60_0.ourScore % 10)
			setActive(arg_60_0.scoreUI, true)
			quickPlayAnimation(arg_60_0.scoreUI, "Anim_Dorm3d_volleyball_score_leftin")
		end,
		[var_0_0.ROUND_RESULT.OTHER_WIN] = function()
			arg_60_0.otherScore = arg_60_0.otherScore + 1

			setText(arg_60_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_60_0.otherScore % 10)
			setActive(arg_60_0.scoreUI, true)
			quickPlayAnimation(arg_60_0.scoreUI, "Anim_Dorm3d_volleyball_score_rightin")
		end
	}, function()
		assert(false, "unknow round result" .. arg_60_0.roundResult)
	end)
end

function var_0_0.CheckEndGame(arg_64_0)
	if arg_64_0.ourScore >= var_0_0.endScore then
		arg_64_0.gameResult = var_0_0.GAME_RESULT.VICTORY

		return true
	end

	if arg_64_0.otherScore >= var_0_0.endScore then
		arg_64_0.gameResult = var_0_0.GAME_RESULT.DEFEAT

		return true
	end

	return false
end

function var_0_0.EndGame(arg_65_0)
	if arg_65_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
		pg.CriMgr.GetInstance():PlaySE_V3(var_0_7)
	end

	seriesAsync({
		function(arg_66_0)
			local var_66_0 = arg_65_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "shibai" or "shengli"

			arg_65_0:PlayTimeline({
				name = arg_65_0:GetWeightTimeline(var_66_0)
			}, arg_66_0)
		end
	}, function()
		arg_65_0:PlayTimeline({
			name = arg_65_0:GetWeightTimeline("daiji")
		}, function()
			return
		end)
		setActive(arg_65_0.endUI, true)
		setActive(arg_65_0.endUI:Find("Title/Victory"), arg_65_0.gameResult == var_0_0.GAME_RESULT.VICTORY)
		setActive(arg_65_0.endUI:Find("Title/Defeat"), arg_65_0.gameResult == var_0_0.GAME_RESULT.DEFEAT)
		arg_65_0:UpdateScoreTpl(arg_65_0.endUI:Find("ScoreTpl"))
	end)
end

function var_0_0.ShowResultUI(arg_69_0, arg_69_1)
	(function()
		local var_70_0 = arg_69_0.contextData.roomId
		local var_70_1 = arg_69_0.contextData.groupId
		local var_70_2 = arg_69_0.contextData.groupIds or {
			var_70_1
		}
		local var_70_3 = table.concat(var_70_2, ",")
		local var_70_4 = arg_69_0.ourScore .. ":" .. arg_69_0.otherScore

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataRoom(var_70_0, 8, var_70_3, var_70_4))
	end)()
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_8)
	seriesAsync({
		function(arg_71_0)
			quickPlayAnimation(arg_69_0.endUI, "Anim_Dorm3d_volleyball_end_out")
			onDelayTick(function()
				setActive(arg_69_0.endUI, false)
			end, 0.1)

			if arg_69_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
				arg_69_0:PlayTimeline({
					name = arg_69_0:GetWeightTimeline("jiangli")
				}, arg_71_0)
			else
				arg_69_0:StopPlayingTimeline()
				arg_71_0()
			end
		end
	}, function()
		setActive(arg_69_0.resultUI, true)

		local var_73_0

		var_73_0 = arg_69_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "Victory" or "Defeat"

		setText(arg_69_0.resultUI:Find("Panel/Text"), i18n("volleyball_end_tip", arg_69_0.apartment:getConfig("name")))

		if arg_69_1 and arg_69_1.cost > 0 then
			setActive(arg_69_0.resultUI:Find("Panel/Award"), true)
			setText(arg_69_0.resultUI:Find("Panel/Award/Text"), i18n("volleyball_end_award", arg_69_0.apartment:getConfig("name")))
		else
			setActive(arg_69_0.resultUI:Find("Panel/Award"), false)
		end

		gcAll()
	end)
end

function var_0_0.FaQiuOP(arg_74_0, arg_74_1)
	arg_74_0:PlayTimeline({
		name = arg_74_0:GetWeightTimeline("faqiu")
	}, arg_74_1)
end

function var_0_0.StartQTE(arg_75_0, arg_75_1)
	arg_75_0.qteCallback = arg_75_1

	setActive(arg_75_0.ballCamera, true)
	setActive(arg_75_0.mainCamera, false)

	arg_75_0.randomScreenPos = Vector2(math.random(var_0_0.BallRandomDelat.Left, Screen.width - var_0_0.BallRandomDelat.Right), math.random(var_0_0.BallRandomDelat.Bottom, Screen.height - var_0_0.BallRandomDelat.Top))

	local var_75_0 = arg_75_0.ballCameraComp:ScreenPointToRay(arg_75_0.randomScreenPos)

	arg_75_0.randomScale = math.random(var_0_0.perfectScaleRandoms[1] * 10, arg_75_0.perfectScaleRandoms[2] * 10) / 10

	local var_75_1 = (var_0_0.perfectRadiusMax + var_0_0.perfectRadiusMin) / 2 * arg_75_0.randomScale / var_0_0.triggerRadius
	local var_75_2 = arg_75_0.ballQtePlane.distance + (arg_75_0.ballMissPlane.distance - arg_75_0.ballQtePlane.distance) * (1 - var_75_1)
	local var_75_3, var_75_4 = Plane.New(arg_75_0.ballQtePlane.normal, var_75_2):Raycast(var_75_0)

	assert(var_75_3, "retPerfect plane not in view")

	arg_75_0.ballDir = (var_75_0:GetPoint(var_75_4) - var_0_0.BallInitPos):Normalize()

	local var_75_5 = Ray.New(arg_75_0.ballDir, var_0_0.BallInitPos)
	local var_75_6, var_75_7 = arg_75_0.ballQtePlane:Raycast(var_75_5)

	assert(var_75_6, "qte plane not in view")

	local var_75_8 = var_75_5:GetPoint(var_75_7)
	local var_75_9, var_75_10 = arg_75_0.ballMissPlane:Raycast(var_75_5)

	assert(var_75_9, "miss plane not in view")

	local var_75_11 = var_75_5:GetPoint(var_75_10)
	local var_75_12 = 0

	arg_75_0.qteUITime = (var_75_8 - var_75_11):Magnitude() / var_0_0.BallQTESpeed
	arg_75_0.ballTimer = Timer.New(function()
		if var_75_12 >= var_75_10 then
			arg_75_0.ballTimer:Stop()

			arg_75_0.ballTimer = nil

			setActive(arg_75_0.ballTF, false)

			arg_75_0.ballTF.position = var_0_0.BallInitPos

			if arg_75_0.startQTEUI then
				setLocalScale(arg_75_0.qteTriggerTF, {
					x = 0,
					y = 0
				})
				arg_75_0:EndQTE(var_0_0.QTE_RESULT.MISS)
			end
		elseif var_75_12 >= var_75_7 then
			var_75_12 = var_75_12 + var_0_0.BallQTESpeed
			arg_75_0.ballTF.position = var_75_5:GetPoint(var_75_12)

			if not arg_75_0.startQTEUI then
				arg_75_0:StartQTEUI()
			end

			arg_75_0.curScale = arg_75_0.curScale - 1 / arg_75_0.qteUITime

			setLocalScale(arg_75_0.qteTriggerTF, {
				x = arg_75_0.curScale,
				y = arg_75_0.curScale
			})

			arg_75_0.curRadius = var_0_0.triggerRadius * arg_75_0.curScale

			if arg_75_0.curScale < 0 then
				arg_75_0:EndQTE()
			end
		else
			var_75_12 = var_75_12 + var_0_0.BallSpeed
			arg_75_0.ballTF.position = var_75_5:GetPoint(var_75_12)
		end
	end, 0.016666666666666666, -1)

	setActive(arg_75_0.ballTF, true)
	arg_75_0.ballTimer:Start()
end

function var_0_0.StartQTEUI(arg_77_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_2)
	setLocalScale(arg_77_0.qteTriggerTF, {
		x = 1,
		y = 1
	})
	eachChild(arg_77_0.qteTF:Find("animroot/Result"), function(arg_78_0)
		setActive(arg_78_0, false)
	end)

	arg_77_0.qteResult = nil
	arg_77_0.curRadius = var_0_0.triggerRadius
	arg_77_0.curPerfectRadiusMax = var_0_0.perfectRadiusMax * arg_77_0.randomScale
	arg_77_0.curPerfectRadiusMin = var_0_0.perfectRadiusMin * arg_77_0.randomScale

	setLocalScale(arg_77_0.qteTF:Find("animroot/Perfect"), {
		x = arg_77_0.randomScale,
		y = arg_77_0.randomScale
	})

	arg_77_0.curScale = 1

	setLocalPosition(arg_77_0.qteTF, LuaHelper.ScreenToLocal(arg_77_0.qteTF.parent, arg_77_0.randomScreenPos, pg.UIMgr.GetInstance().uiCameraComp))
	setActive(arg_77_0.qteTF, true)

	arg_77_0.startQTEUI = true
end

function var_0_0.EndQTE(arg_79_0, arg_79_1)
	arg_79_0.startQTEUI = nil

	setActive(arg_79_0.mainCamera, true)
	setActive(arg_79_0.ballCamera, false)

	if arg_79_1 then
		arg_79_0.qteResult = arg_79_1
	elseif arg_79_0.curRadius < var_0_0.hitRadiusMin or arg_79_0.curRadius > var_0_0.hitRadiusMax then
		arg_79_0.qteResult = var_0_0.QTE_RESULT.MISS
	elseif arg_79_0.curRadius <= arg_79_0.curPerfectRadiusMax and arg_79_0.curRadius >= arg_79_0.curPerfectRadiusMin then
		arg_79_0.qteResult = var_0_0.QTE_RESULT.PERFECT
	else
		arg_79_0.qteResult = var_0_0.QTE_RESULT.HIT
	end

	eachChild(arg_79_0.qteTF:Find("animroot/Result"), function(arg_80_0)
		setActive(arg_80_0, arg_80_0.name == arg_79_0.qteResult)
	end)

	if arg_79_0.ballTimer then
		arg_79_0.ballTimer:Stop()

		arg_79_0.ballTimer = nil

		setActive(arg_79_0.ballTF, false)

		arg_79_0.ballTF.position = var_0_0.BallInitPos
	end

	if arg_79_0.qteCallback then
		arg_79_0.qteCallback()

		arg_79_0.qteCallback = nil
	end

	onDelayTick(function()
		setActive(arg_79_0.qteTF, false)
	end, 1)
end

function var_0_0.QteMissOP(arg_82_0, arg_82_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_5)
	arg_82_0:PlayTimeline({
		name = arg_82_0:GetWeightTimeline("shiqiu")
	}, arg_82_1)
end

function var_0_0.QteHitOP(arg_83_0, arg_83_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_3)
	seriesAsync({
		function(arg_84_0)
			arg_83_0:PlayTimeline({
				name = arg_83_0:GetWeightTimeline("fly")
			}, arg_84_0)
		end,
		function(arg_85_0)
			arg_83_0:PlayTimeline({
				name = arg_83_0:GetWeightTimeline("jieqiu")
			}, arg_85_0)
		end
	}, arg_83_1)
end

function var_0_0.QtePerfectOP(arg_86_0, arg_86_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_4)
	seriesAsync({
		function(arg_87_0)
			arg_86_0:PlayTimeline({
				name = arg_86_0:GetWeightTimeline("max_fly")
			}, arg_87_0)
		end,
		function(arg_88_0)
			arg_86_0:PlayTimeline({
				name = arg_86_0:GetWeightTimeline("shouji")
			}, arg_88_0)
		end
	}, arg_86_1)
end

function var_0_0.GetWeightTimeline(arg_89_0, arg_89_1)
	local var_89_0 = arg_89_0.volleyballCfg[arg_89_1]

	assert(var_89_0 ~= "", "volleyball cfg is empty string" .. arg_89_1)
	assert(#var_89_0 ~= 0, "volleyball cfg is empty table:" .. arg_89_1)

	local var_89_1 = underscore.reduce(var_89_0, 0, function(arg_90_0, arg_90_1)
		return arg_90_0 + arg_90_1[2]
	end)
	local var_89_2 = math.random() * var_89_1
	local var_89_3 = 0

	for iter_89_0, iter_89_1 in ipairs(var_89_0) do
		var_89_3 = var_89_3 + iter_89_1[2]

		if var_89_2 <= var_89_3 then
			return iter_89_1[1]
		end
	end
end

function var_0_0.DoTimelineRandomTrack(arg_91_0, arg_91_1)
	local var_91_0 = {}
	local var_91_1 = TimelineHelper.GetTimelineTracks(arg_91_1)

	for iter_91_0 = 0, var_91_1.Length - 1 do
		local var_91_2 = var_91_1[iter_91_0]

		if var_91_2.name ~= "Markers" then
			var_91_2.muted = true

			table.insert(var_91_0, var_91_2)
		end
	end

	if #var_91_0 > 0 then
		local var_91_3 = var_91_0[math.random(#var_91_0)]

		underscore.each(var_91_0, function(arg_92_0)
			if arg_92_0.name == var_91_3.name then
				arg_92_0.muted = false
			end
		end)

		arg_91_0.debugTrackName.text = var_91_3.name
	else
		arg_91_0.debugTrackName.text = "track cnt 0"
	end
end

function var_0_0.OnPause(arg_93_0)
	if arg_93_0.ballTimer then
		arg_93_0.ballTimer:Stop()
	end

	if arg_93_0.playingDirector then
		arg_93_0.playingDirector:Pause()
	end
end

function var_0_0.OnResume(arg_94_0)
	if arg_94_0.ballTimer then
		arg_94_0.ballTimer:Start()
	end

	if arg_94_0.playingDirector then
		arg_94_0.playingDirector:Play()
	end
end

function var_0_0.onBackPressed(arg_95_0)
	if not arg_95_0.playingFlag or isActive(arg_95_0.gameUI:Find("Count")) or isActive(arg_95_0.endUI) then
		return
	end

	arg_95_0:OnPause()
	pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_MSGBOX, {
		contentText = i18n("sure_exit_volleyball"),
		onConfirm = function()
			arg_95_0:emit(var_0_0.ON_BACK)
		end,
		onClose = function()
			arg_95_0:OnResume()
		end
	})
end

function var_0_0.willExit(arg_98_0)
	arg_98_0.loader:Clear()

	if arg_98_0.ballTimer then
		arg_98_0.ballTimer:Stop()

		arg_98_0.ballTimer = nil
	end

	local var_98_0 = {
		{
			path = string.lower("dorm3d/character/" .. arg_98_0.timelineSceneRootName .. "/timeline/" .. arg_98_0.timelineSceneName .. "/" .. arg_98_0.timelineSceneName .. "_scene"),
			name = arg_98_0.timelineSceneName
		},
		{
			path = string.lower("dorm3d/scenesres/scenes/common/" .. arg_98_0.sceneRootName .. "/" .. arg_98_0.sceneName .. "_scene"),
			name = arg_98_0.sceneName
		}
	}
	local var_98_1 = underscore.map(var_98_0, function(arg_99_0)
		return function(arg_100_0)
			SceneOpMgr.Inst:UnloadSceneAsync(arg_99_0.path, arg_99_0.name, arg_100_0)
		end
	end)

	seriesAsync(var_98_1, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

return var_0_0
