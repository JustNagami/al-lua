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

function var_0_0.Ctor(arg_2_0, ...)
	var_0_0.super.Ctor(arg_2_0, ...)

	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.preload(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.contextData.groupId or 20220

	arg_3_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_3_0))

	arg_3_0.volleyballCfg = pg.dorm3d_volleyball[var_3_0]
	arg_3_0.sceneRootName = "beach"
	arg_3_0.sceneName = "map_beach_01"
	arg_3_0.timelineSceneRootName = pg.dorm3d_dorm_template[var_3_0].asset_name
	arg_3_0.timelineSceneName = arg_3_0.volleyballCfg.scene_name

	seriesAsync({
		function(arg_4_0)
			pg.UIMgr.GetInstance():LoadingOn(false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/common/" .. arg_3_0.sceneRootName .. "/" .. arg_3_0.sceneName .. "_scene"), arg_3_0.sceneName, LoadSceneMode.Additive, function(arg_5_0, arg_5_1)
				SceneManager.SetActiveScene(arg_5_0)
				onNextTick(arg_4_0)
			end)
		end,
		function(arg_6_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. arg_3_0.timelineSceneRootName .. "/timeline_volleyball/" .. arg_3_0.timelineSceneName .. "_scene"), arg_3_0.timelineSceneName, LoadSceneMode.Additive, function(arg_7_0, arg_7_1)
				arg_6_0()
			end)
		end,
		function(arg_8_0)
			pg.UIMgr.GetInstance():LoadingOff()
			arg_8_0()
		end,
		arg_3_1
	})
end

function var_0_0.init(arg_9_0)
	arg_9_0:initUI()
	arg_9_0:initScene()
	arg_9_0:BindEvent()
end

function var_0_0.initUI(arg_10_0)
	arg_10_0.skipUI = arg_10_0._tf:Find("SkipUI")

	setActive(arg_10_0.skipUI, false)

	arg_10_0.gameUI = arg_10_0._tf:Find("GameUI")

	setText(arg_10_0.gameUI:Find("Title/Text"), i18n("dorm3d_volleyball_title"))

	arg_10_0.ourScoreTF = arg_10_0.gameUI:Find("Score/Content/Left")
	arg_10_0.otherScoreTF = arg_10_0.gameUI:Find("Score/Content/Right")
	arg_10_0.qteTF = arg_10_0.gameUI:Find("QTE")
	arg_10_0.qteTriggerTF = arg_10_0.gameUI:Find("QTE/animroot/Trigger")

	setActive(arg_10_0.qteTF, false)
	setActive(arg_10_0.gameUI, false)

	arg_10_0.scoreUI = arg_10_0._tf:Find("ScoreUI")

	setActive(arg_10_0.scoreUI, false)

	arg_10_0.endUI = arg_10_0._tf:Find("EndUI")

	setActive(arg_10_0.endUI, false)

	arg_10_0.resultUI = arg_10_0._tf:Find("ResultUI")

	setActive(arg_10_0.resultUI, false)
	setText(arg_10_0.resultUI:Find("AgainBtn/Text"), i18n("dorm3d_minigame_again"))
	setText(arg_10_0.resultUI:Find("CloseBtn/Text"), i18n("dorm3d_minigame_close"))

	local var_10_0 = arg_10_0._tf:Find("Debug")

	setActive(var_10_0, false)

	arg_10_0.debugTimelineName = var_10_0:Find("Timeline"):GetComponent(typeof(Text))
	arg_10_0.debugTrackName = var_10_0:Find("Track"):GetComponent(typeof(Text))
end

function var_0_0.BindEvent(arg_11_0)
	onButton(arg_11_0, arg_11_0.gameUI:Find("Title/BackBtn"), function()
		arg_11_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.gameUI, function()
		if not arg_11_0.startQTEUI then
			return
		end

		arg_11_0:EndQTE()
	end)
	onButton(arg_11_0, arg_11_0.skipUI:Find("SkipBtn"), function()
		setActive(arg_11_0.skipUI, false)
		arg_11_0:StopPlayingTimeline()
		arg_11_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.endUI, function()
		arg_11_0:emit(Dorm3dGameMediatorTemplate.TRIGGER_FAVOR, arg_11_0.apartment.configId)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.resultUI:Find("AgainBtn"), function()
		setActive(arg_11_0.resultUI, false)
		arg_11_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.resultUI:Find("CloseBtn"), function()
		arg_11_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
end

function var_0_0.initScene(arg_18_0)
	local var_18_0 = SceneManager.GetSceneByName(arg_18_0.sceneName):GetRootGameObjects()

	table.IpairsCArray(var_18_0, function(arg_19_0, arg_19_1)
		if arg_19_1.name == "[MainBlock]" then
			arg_18_0.modelRoot = tf(arg_19_1):Find("[Model]/scene_root")
			arg_18_0.ballTF = arg_18_0.modelRoot:Find("fbx/litmap05/pre_db_sportinggoods03")
			arg_18_0.ballTF.position = var_0_0.BallInitPos

			setActive(arg_18_0.ballTF, false)
		elseif arg_19_1.name == "MainCamera" then
			arg_18_0.mainCamera = arg_19_1.transform

			setActive(arg_18_0.mainCamera, false)
		elseif arg_19_1.name == "PlayerCamera" then
			arg_18_0.ballCamera = arg_19_1.transform
			arg_18_0.ballCameraComp = arg_18_0.ballCamera:GetComponent(typeof(Camera))

			setActive(arg_18_0.ballCamera, false)
		elseif arg_19_1.name == "TriggerPlane" then
			setActive(arg_19_1, false)

			local var_19_0 = tf(arg_19_1):Find("BallCreate")
			local var_19_1 = var_19_0:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_18_0.ballCreatePlane = Plane.New(var_19_1.normals[0], -Vector3.Dot(var_19_0.position, var_19_1.normals[0]))

			local var_19_2 = tf(arg_19_1):Find("BallQte")
			local var_19_3 = var_19_2:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_18_0.ballQtePlane = Plane.New(var_19_3.normals[0], -Vector3.Dot(var_19_2.position, var_19_3.normals[0]))

			local var_19_4 = tf(arg_19_1):Find("BallMiss")
			local var_19_5 = var_19_4:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_18_0.ballMissPlane = Plane.New(var_19_5.normals[0], -Vector3.Dot(var_19_4.position, var_19_5.normals[0]))
		end
	end)
	arg_18_0:InitLightSettings()

	local var_18_1 = SceneManager.GetSceneByName(arg_18_0.timelineSceneName):GetRootGameObjects()

	arg_18_0.totalDirectorList = {}

	table.IpairsCArray(var_18_1, function(arg_20_0, arg_20_1)
		local var_20_0 = tf(arg_20_1):Find("[sequence]")

		if IsNil(var_20_0) then
			return
		end

		local var_20_1 = var_20_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		var_20_1.playOnAwake = false

		table.insert(arg_18_0.totalDirectorList, {
			name = arg_20_1.name,
			director = var_20_1
		})
		setActive(arg_20_1, false)
	end)
end

function var_0_0.InitLightSettings(arg_21_0)
	arg_21_0.globalVolume = GameObject.Find("GlobalVolume")
	arg_21_0.characterLight = GameObject.Find("CharacterLight")

	local var_21_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_21_0:GetComponentsInChildren(typeof(Light)), function(arg_22_0, arg_22_1)
		arg_22_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.didEnter(arg_23_0)
	arg_23_0:InitData()
	setActive(arg_23_0.skipUI, true)
	arg_23_0:PlayTimeline({
		name = arg_23_0:GetWeightTimeline("jinchang")
	}, function()
		if not arg_23_0.playingFlag then
			setActive(arg_23_0.skipUI, false)
			arg_23_0:StartGame()
		end
	end)
end

function var_0_0.InitData(arg_25_0)
	return
end

function var_0_0.PlayTimeline(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0:StopPlayingTimeline()

	local var_26_0 = {}
	local var_26_1 = arg_26_1.name
	local var_26_2 = arg_26_1.track
	local var_26_3 = _.detect(arg_26_0.totalDirectorList, function(arg_27_0)
		return arg_27_0.name == var_26_1
	end)

	assert(var_26_3, "Missing director " .. var_26_1)

	if not var_26_3 then
		existCall(arg_26_2)

		return
	end

	arg_26_0.playingDirector = var_26_3.director

	local var_26_4 = arg_26_0.playingDirector.transform

	arg_26_0.debugTimelineName.text = var_26_4.parent.name

	table.insert(var_26_0, function(arg_28_0)
		setActive(tf(arg_26_0.playingDirector).parent, true)
		arg_26_0.playingDirector:Stop()

		if arg_26_1.time then
			arg_26_0.playingDirector.time = math.clamp(arg_26_1.time, 0, arg_26_0.playingDirector.duration)
		end

		if defaultValue(arg_26_0.timelineSpeed, 1) ~= 1 then
			arg_26_0.timelineSpeed = 1

			setDirectorSpeed(arg_26_0.playingDirector, arg_26_0.timelineSpeed)
		end

		arg_26_0.bindingConfig = arg_26_0.bindingConfig or _.reduce(pg.dorm3d_timeline_dynamic_binding, {}, function(arg_29_0, arg_29_1)
			if arg_29_1.track_name then
				arg_29_0[arg_29_1.track_name] = arg_29_1.object_name
			end

			return arg_29_0
		end)

		eachChild(arg_26_0.playingDirector, function(arg_30_0)
			local var_30_0 = arg_30_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

			if not var_30_0 then
				return
			end

			table.IpairsCArray(TimelineHelper.GetTimelineTracks(var_30_0), function(arg_31_0, arg_31_1)
				if arg_26_0.bindingConfig[arg_31_1.name] then
					local var_31_0 = GameObject.Find(arg_26_0.bindingConfig[arg_31_1.name])

					if var_31_0 then
						TimelineHelper.SetSceneBinding(var_30_0, arg_31_1, var_31_0)
					else
						warning(string.format("轨道%s需要绑定的物体%s不存在", arg_31_1.name, arg_26_0.bindingConfig[arg_31_1.name]))
					end
				end
			end)
		end)

		local var_28_0 = {}

		GetOrAddComponent(var_26_4, "DftCommonSignalReceiver"):SetCommonEvent(function(arg_32_0)
			switch(arg_32_0.stringParameter, {
				TimelineRandomTrack = function()
					arg_26_0:DoTimelineRandomTrack(arg_26_0.playingDirector)
				end,
				TimelineLoop = function()
					arg_26_0.playingDirector.time = arg_32_0.floatParameter
				end,
				TimelineEnd = function()
					var_28_0.finish = true

					arg_26_0.playingDirector:Pause()
					setActive(tf(arg_26_0.playingDirector).parent, false)
				end
			}, function()
				warning("other event trigger:" .. arg_32_0.stringParameter)
			end)

			if var_28_0.finish then
				arg_26_0.timelineMark = var_28_0
				arg_26_0.debugTimelineName.text = ""
				arg_26_0.debugTrackName.text = ""

				arg_28_0()
			end
		end)
		arg_26_0.playingDirector:Evaluate()
		arg_26_0:DoTimelineRandomTrack(arg_26_0.playingDirector)
		arg_26_0.playingDirector:Play()
		setActive(arg_26_0.mainCamera, false)

		if arg_26_0.activeDirectorInfo then
			arg_26_0.lastDirectorInfo = arg_26_0.activeDirectorInfo
		end

		arg_26_0.activeDirectorInfo = var_26_3
	end)
	seriesAsync(var_26_0, function()
		setActive(arg_26_0.mainCamera, true)

		arg_26_0.playingDirector = nil

		local var_37_0 = arg_26_0.timelineMark

		arg_26_0.timelineMark = nil

		existCall(arg_26_2, var_37_0)
	end)
end

function var_0_0.StopPlayingTimeline(arg_38_0)
	if arg_38_0.playingDirector then
		arg_38_0.playingDirector:Stop()
		setActive(tf(arg_38_0.playingDirector).parent, false)

		arg_38_0.debugTimelineName.text = ""
		arg_38_0.debugTrackName.text = ""

		setActive(arg_38_0.mainCamera, true)
	end
end

function var_0_0.StartGame(arg_39_0)
	setActive(arg_39_0.mainCamera, true)

	arg_39_0.playingFlag = true
	arg_39_0.gameResult = nil
	arg_39_0.ourScore, arg_39_0.otherScore = 0, 0

	setActive(arg_39_0.gameUI, true)
	setActive(arg_39_0.gameUI:Find("Score"), false)

	local var_39_0 = arg_39_0.gameUI:Find("Count")

	setActive(var_39_0, true)

	local var_39_1 = var_39_0:GetComponent(typeof(DftAniEvent))

	var_39_1:SetEndEvent(function()
		setActive(var_39_0, false)
		arg_39_0:StartOneRound()
		setActive(arg_39_0.gameUI:Find("Score"), true)
		var_39_1:SetEndEvent(nil)
	end)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_1)
end

function var_0_0.UpdateGameScore(arg_41_0)
	setText(arg_41_0.ourScoreTF, arg_41_0.ourScore)
	setText(arg_41_0.otherScoreTF, arg_41_0.otherScore)
end

function var_0_0.UpdateScoreTpl(arg_42_0, arg_42_1)
	setText(arg_42_1:Find("Left/Tens/Text"), 0)
	setText(arg_42_1:Find("Left/Units/Text"), arg_42_0.ourScore % 10)
	setText(arg_42_1:Find("Right/Tens/Text"), 0)
	setText(arg_42_1:Find("Right/Units/Text"), arg_42_0.otherScore % 10)
end

function var_0_0.StartOneRound(arg_43_0)
	arg_43_0:UpdateGameScore()

	arg_43_0.roundEndFlag = false
	arg_43_0.roundResult = nil

	seriesAsync({
		function(arg_44_0)
			arg_43_0:FaQiuOP(arg_44_0)
		end,
		function(arg_45_0)
			arg_43_0:OneQTE()
		end
	})
end

function var_0_0.OneQTE(arg_46_0)
	seriesAsync({
		function(arg_47_0)
			arg_46_0:StartQTE(arg_47_0)
		end,
		function(arg_48_0)
			switch(arg_46_0.qteResult, {
				[var_0_0.QTE_RESULT.MISS] = function()
					arg_46_0:QteMissOP(function()
						arg_46_0.roundEndFlag = true
						arg_46_0.roundResult = var_0_0.ROUND_RESULT.OTHER_WIN

						arg_48_0()
					end)
				end,
				[var_0_0.QTE_RESULT.HIT] = function()
					arg_46_0:QteHitOP(arg_48_0)
				end,
				[var_0_0.QTE_RESULT.PERFECT] = function()
					arg_46_0:QtePerfectOP(function()
						arg_46_0.roundEndFlag = true
						arg_46_0.roundResult = var_0_0.ROUND_RESULT.OUR_WIN

						arg_48_0()
					end)
				end
			}, function()
				assert(false, "unknow qte result" .. arg_46_0.qteResult)
			end)
		end
	}, function()
		if not arg_46_0.roundEndFlag then
			arg_46_0:OneQTE()
		else
			arg_46_0:EndOneRound()
		end
	end)
end

function var_0_0.EndOneRound(arg_56_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_6)

	local var_56_0 = arg_56_0.scoreUI:GetComponent(typeof(DftAniEvent))

	var_56_0:SetEndEvent(function()
		quickPlayAnimation(arg_56_0.scoreUI, "Anim_Dorm3d_volleyball_score_out")
		onDelayTick(function()
			setActive(arg_56_0.scoreUI, false)
		end, 0.1)

		if arg_56_0:CheckEndGame() then
			arg_56_0:EndGame()
		else
			setActive(arg_56_0.gameUI, true)
			arg_56_0:StartOneRound()
		end

		var_56_0:SetEndEvent(nil)
	end)
	setActive(arg_56_0.gameUI, false)
	arg_56_0:UpdateScoreTpl(arg_56_0.scoreUI:Find("ScoreTpl"))
	setText(arg_56_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_56_0.ourScore % 10)
	setText(arg_56_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_56_0.otherScore % 10)
	switch(arg_56_0.roundResult, {
		[var_0_0.ROUND_RESULT.OUR_WIN] = function()
			arg_56_0.ourScore = arg_56_0.ourScore + 1

			setText(arg_56_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_56_0.ourScore % 10)
			setActive(arg_56_0.scoreUI, true)
			quickPlayAnimation(arg_56_0.scoreUI, "Anim_Dorm3d_volleyball_score_leftin")
		end,
		[var_0_0.ROUND_RESULT.OTHER_WIN] = function()
			arg_56_0.otherScore = arg_56_0.otherScore + 1

			setText(arg_56_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_56_0.otherScore % 10)
			setActive(arg_56_0.scoreUI, true)
			quickPlayAnimation(arg_56_0.scoreUI, "Anim_Dorm3d_volleyball_score_rightin")
		end
	}, function()
		assert(false, "unknow round result" .. arg_56_0.roundResult)
	end)
end

function var_0_0.CheckEndGame(arg_62_0)
	if arg_62_0.ourScore >= var_0_0.endScore then
		arg_62_0.gameResult = var_0_0.GAME_RESULT.VICTORY

		return true
	end

	if arg_62_0.otherScore >= var_0_0.endScore then
		arg_62_0.gameResult = var_0_0.GAME_RESULT.DEFEAT

		return true
	end

	return false
end

function var_0_0.EndGame(arg_63_0)
	if arg_63_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
		pg.CriMgr.GetInstance():PlaySE_V3(var_0_7)
	end

	seriesAsync({
		function(arg_64_0)
			local var_64_0 = arg_63_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "shibai" or "shengli"

			arg_63_0:PlayTimeline({
				name = arg_63_0:GetWeightTimeline(var_64_0)
			}, arg_64_0)
		end
	}, function()
		arg_63_0:PlayTimeline({
			name = arg_63_0:GetWeightTimeline("daiji")
		}, function()
			return
		end)
		setActive(arg_63_0.endUI, true)
		setActive(arg_63_0.endUI:Find("Title/Victory"), arg_63_0.gameResult == var_0_0.GAME_RESULT.VICTORY)
		setActive(arg_63_0.endUI:Find("Title/Defeat"), arg_63_0.gameResult == var_0_0.GAME_RESULT.DEFEAT)
		arg_63_0:UpdateScoreTpl(arg_63_0.endUI:Find("ScoreTpl"))
	end)
end

function var_0_0.ShowResultUI(arg_67_0, arg_67_1)
	(function()
		local var_68_0 = arg_67_0.contextData.roomId
		local var_68_1 = table.concat(arg_67_0.contextData.groupIds, ",")
		local var_68_2 = arg_67_0.ourScore .. ":" .. arg_67_0.otherScore

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataRoom(var_68_0, 8, var_68_1, var_68_2))
	end)()
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_8)
	seriesAsync({
		function(arg_69_0)
			quickPlayAnimation(arg_67_0.endUI, "Anim_Dorm3d_volleyball_end_out")
			onDelayTick(function()
				setActive(arg_67_0.endUI, false)
			end, 0.1)

			if arg_67_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
				arg_67_0:PlayTimeline({
					name = arg_67_0:GetWeightTimeline("jiangli")
				}, arg_69_0)
			else
				arg_67_0:StopPlayingTimeline()
				arg_69_0()
			end
		end
	}, function()
		setActive(arg_67_0.resultUI, true)

		local var_71_0

		var_71_0 = arg_67_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "Victory" or "Defeat"

		setText(arg_67_0.resultUI:Find("Panel/Text"), i18n("volleyball_end_tip"))

		if arg_67_1 then
			setActive(arg_67_0.resultUI:Find("Panel/Award"), true)
			setText(arg_67_0.resultUI:Find("Panel/Award/Text"), i18n("volleyball_end_award", arg_67_1.cost, arg_67_1.delta))
		else
			setActive(arg_67_0.resultUI:Find("Panel/Award"), false)
		end
	end)
end

function var_0_0.FaQiuOP(arg_72_0, arg_72_1)
	arg_72_0:PlayTimeline({
		name = arg_72_0:GetWeightTimeline("faqiu")
	}, arg_72_1)
end

function var_0_0.StartQTE(arg_73_0, arg_73_1)
	arg_73_0.qteCallback = arg_73_1

	setActive(arg_73_0.ballCamera, true)
	setActive(arg_73_0.mainCamera, false)

	arg_73_0.randomScreenPos = Vector2(math.random(var_0_0.BallRandomDelat.Left, Screen.width - var_0_0.BallRandomDelat.Right), math.random(var_0_0.BallRandomDelat.Bottom, Screen.height - var_0_0.BallRandomDelat.Top))

	local var_73_0 = arg_73_0.ballCameraComp:ScreenPointToRay(arg_73_0.randomScreenPos)

	arg_73_0.randomScale = math.random(var_0_0.perfectScaleRandoms[1] * 10, arg_73_0.perfectScaleRandoms[2] * 10) / 10

	local var_73_1 = (var_0_0.perfectRadiusMax + var_0_0.perfectRadiusMin) / 2 * arg_73_0.randomScale / var_0_0.triggerRadius
	local var_73_2 = arg_73_0.ballQtePlane.distance + (arg_73_0.ballMissPlane.distance - arg_73_0.ballQtePlane.distance) * (1 - var_73_1)
	local var_73_3, var_73_4 = Plane.New(arg_73_0.ballQtePlane.normal, var_73_2):Raycast(var_73_0)

	assert(var_73_3, "retPerfect plane not in view")

	arg_73_0.ballDir = (var_73_0:GetPoint(var_73_4) - var_0_0.BallInitPos):Normalize()

	local var_73_5 = Ray.New(arg_73_0.ballDir, var_0_0.BallInitPos)
	local var_73_6, var_73_7 = arg_73_0.ballQtePlane:Raycast(var_73_5)

	assert(var_73_6, "qte plane not in view")

	local var_73_8 = var_73_5:GetPoint(var_73_7)
	local var_73_9, var_73_10 = arg_73_0.ballMissPlane:Raycast(var_73_5)

	assert(var_73_9, "miss plane not in view")

	local var_73_11 = var_73_5:GetPoint(var_73_10)
	local var_73_12 = 0

	arg_73_0.qteUITime = (var_73_8 - var_73_11):Magnitude() / var_0_0.BallQTESpeed
	arg_73_0.ballTimer = Timer.New(function()
		if var_73_12 >= var_73_10 then
			arg_73_0.ballTimer:Stop()

			arg_73_0.ballTimer = nil

			setActive(arg_73_0.ballTF, false)

			arg_73_0.ballTF.position = var_0_0.BallInitPos

			if arg_73_0.startQTEUI then
				setLocalScale(arg_73_0.qteTriggerTF, {
					x = 0,
					y = 0
				})
				arg_73_0:EndQTE(var_0_0.QTE_RESULT.MISS)
			end
		elseif var_73_12 >= var_73_7 then
			var_73_12 = var_73_12 + var_0_0.BallQTESpeed
			arg_73_0.ballTF.position = var_73_5:GetPoint(var_73_12)

			if not arg_73_0.startQTEUI then
				arg_73_0:StartQTEUI()
			end

			arg_73_0.curScale = arg_73_0.curScale - 1 / arg_73_0.qteUITime

			setLocalScale(arg_73_0.qteTriggerTF, {
				x = arg_73_0.curScale,
				y = arg_73_0.curScale
			})

			arg_73_0.curRadius = var_0_0.triggerRadius * arg_73_0.curScale

			if arg_73_0.curScale < 0 then
				arg_73_0:EndQTE()
			end
		else
			var_73_12 = var_73_12 + var_0_0.BallSpeed
			arg_73_0.ballTF.position = var_73_5:GetPoint(var_73_12)
		end
	end, 0.016666666666666666, -1)

	setActive(arg_73_0.ballTF, true)
	arg_73_0.ballTimer:Start()
end

function var_0_0.StartQTEUI(arg_75_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_2)
	setLocalScale(arg_75_0.qteTriggerTF, {
		x = 1,
		y = 1
	})
	eachChild(arg_75_0.qteTF:Find("animroot/Result"), function(arg_76_0)
		setActive(arg_76_0, false)
	end)

	arg_75_0.qteResult = nil
	arg_75_0.curRadius = var_0_0.triggerRadius
	arg_75_0.curPerfectRadiusMax = var_0_0.perfectRadiusMax * arg_75_0.randomScale
	arg_75_0.curPerfectRadiusMin = var_0_0.perfectRadiusMin * arg_75_0.randomScale

	setLocalScale(arg_75_0.qteTF:Find("animroot/Perfect"), {
		x = arg_75_0.randomScale,
		y = arg_75_0.randomScale
	})

	arg_75_0.curScale = 1

	setLocalPosition(arg_75_0.qteTF, LuaHelper.ScreenToLocal(arg_75_0.qteTF.parent, arg_75_0.randomScreenPos, pg.UIMgr.GetInstance().uiCameraComp))
	setActive(arg_75_0.qteTF, true)

	arg_75_0.startQTEUI = true
end

function var_0_0.EndQTE(arg_77_0, arg_77_1)
	arg_77_0.startQTEUI = nil

	setActive(arg_77_0.mainCamera, true)
	setActive(arg_77_0.ballCamera, false)

	if arg_77_1 then
		arg_77_0.qteResult = arg_77_1
	elseif arg_77_0.curRadius < var_0_0.hitRadiusMin or arg_77_0.curRadius > var_0_0.hitRadiusMax then
		arg_77_0.qteResult = var_0_0.QTE_RESULT.MISS
	elseif arg_77_0.curRadius <= arg_77_0.curPerfectRadiusMax and arg_77_0.curRadius >= arg_77_0.curPerfectRadiusMin then
		arg_77_0.qteResult = var_0_0.QTE_RESULT.PERFECT
	else
		arg_77_0.qteResult = var_0_0.QTE_RESULT.HIT
	end

	eachChild(arg_77_0.qteTF:Find("animroot/Result"), function(arg_78_0)
		setActive(arg_78_0, arg_78_0.name == arg_77_0.qteResult)
	end)

	if arg_77_0.ballTimer then
		arg_77_0.ballTimer:Stop()

		arg_77_0.ballTimer = nil

		setActive(arg_77_0.ballTF, false)

		arg_77_0.ballTF.position = var_0_0.BallInitPos
	end

	if arg_77_0.qteCallback then
		arg_77_0.qteCallback()

		arg_77_0.qteCallback = nil
	end

	onDelayTick(function()
		setActive(arg_77_0.qteTF, false)
	end, 1)
end

function var_0_0.QteMissOP(arg_80_0, arg_80_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_5)
	arg_80_0:PlayTimeline({
		name = arg_80_0:GetWeightTimeline("shiqiu")
	}, arg_80_1)
end

function var_0_0.QteHitOP(arg_81_0, arg_81_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_3)
	seriesAsync({
		function(arg_82_0)
			arg_81_0:PlayTimeline({
				name = arg_81_0:GetWeightTimeline("fly")
			}, arg_82_0)
		end,
		function(arg_83_0)
			arg_81_0:PlayTimeline({
				name = arg_81_0:GetWeightTimeline("jieqiu")
			}, arg_83_0)
		end
	}, arg_81_1)
end

function var_0_0.QtePerfectOP(arg_84_0, arg_84_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_4)
	seriesAsync({
		function(arg_85_0)
			arg_84_0:PlayTimeline({
				name = arg_84_0:GetWeightTimeline("max_fly")
			}, arg_85_0)
		end,
		function(arg_86_0)
			arg_84_0:PlayTimeline({
				name = arg_84_0:GetWeightTimeline("shouji")
			}, arg_86_0)
		end
	}, arg_84_1)
end

function var_0_0.GetWeightTimeline(arg_87_0, arg_87_1)
	local var_87_0 = arg_87_0.volleyballCfg[arg_87_1]

	assert(var_87_0 ~= "", "volleyball cfg is empty string" .. arg_87_1)
	assert(#var_87_0 ~= 0, "volleyball cfg is empty table:" .. arg_87_1)

	local var_87_1 = underscore.reduce(var_87_0, 0, function(arg_88_0, arg_88_1)
		return arg_88_0 + arg_88_1[2]
	end)
	local var_87_2 = math.random() * var_87_1
	local var_87_3 = 0

	for iter_87_0, iter_87_1 in ipairs(var_87_0) do
		var_87_3 = var_87_3 + iter_87_1[2]

		if var_87_2 <= var_87_3 then
			return iter_87_1[1]
		end
	end
end

function var_0_0.DoTimelineRandomTrack(arg_89_0, arg_89_1)
	local var_89_0 = {}
	local var_89_1 = TimelineHelper.GetTimelineTracks(arg_89_1)

	for iter_89_0 = 0, var_89_1.Length - 1 do
		local var_89_2 = var_89_1[iter_89_0]

		if var_89_2.name ~= "Markers" then
			var_89_2.muted = true

			table.insert(var_89_0, var_89_2)
		end
	end

	if #var_89_0 > 0 then
		local var_89_3 = var_89_0[math.random(#var_89_0)]

		underscore.each(var_89_0, function(arg_90_0)
			if arg_90_0.name == var_89_3.name then
				arg_90_0.muted = false
			end
		end)

		arg_89_0.debugTrackName.text = var_89_3.name
	else
		arg_89_0.debugTrackName.text = "track cnt 0"
	end
end

function var_0_0.OnPause(arg_91_0)
	if arg_91_0.ballTimer then
		arg_91_0.ballTimer:Stop()
	end

	if arg_91_0.playingDirector then
		arg_91_0.playingDirector:Pause()
	end
end

function var_0_0.OnResume(arg_92_0)
	if arg_92_0.ballTimer then
		arg_92_0.ballTimer:Start()
	end

	if arg_92_0.playingDirector then
		arg_92_0.playingDirector:Play()
	end
end

function var_0_0.onBackPressed(arg_93_0)
	if not arg_93_0.playingFlag or isActive(arg_93_0.gameUI:Find("Count")) or isActive(arg_93_0.endUI) then
		return
	end

	arg_93_0:OnPause()
	pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_MSGBOX, {
		contentText = i18n("sure_exit_volleyball"),
		onConfirm = function()
			arg_93_0:emit(var_0_0.ON_BACK)
		end,
		onClose = function()
			arg_93_0:OnResume()
		end
	})
end

function var_0_0.willExit(arg_96_0)
	arg_96_0.loader:Clear()

	if arg_96_0.ballTimer then
		arg_96_0.ballTimer:Stop()

		arg_96_0.ballTimer = nil
	end

	local var_96_0 = string.lower("dorm3d/character/" .. arg_96_0.timelineSceneRootName .. "/timeline_volleyball/" .. arg_96_0.timelineSceneName .. "_scene")
	local var_96_1 = arg_96_0.timelineSceneName
	local var_96_2 = string.lower("dorm3d/scenesres/scenes/common/" .. arg_96_0.sceneRootName .. "/" .. arg_96_0.sceneName .. "_scene")
	local var_96_3 = arg_96_0.sceneName

	SceneOpMgr.Inst:UnloadSceneAsync(var_96_0, var_96_1, function()
		onNextTick(function()
			SceneOpMgr.Inst:UnloadSceneAsync(var_96_2, var_96_3, function()
				onNextTick(function()
					ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
				end)
			end)
		end)
	end)
end

return var_0_0
