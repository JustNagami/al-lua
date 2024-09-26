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
	local var_8_0 = arg_8_0.contextData.groupId or 20220

	arg_8_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_8_0))

	arg_8_0.volleyballCfg = pg.dorm3d_volleyball[var_8_0]
	arg_8_0.sceneRootName = "beach"
	arg_8_0.sceneName = "map_beach_01"
	arg_8_0.timelineSceneRootName = pg.dorm3d_dorm_template[var_8_0].asset_name
	arg_8_0.timelineSceneName = arg_8_0.volleyballCfg.scene_name

	seriesAsync({
		function(arg_9_0)
			pg.UIMgr.GetInstance():LoadingOn(false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/common/" .. arg_8_0.sceneRootName .. "/" .. arg_8_0.sceneName .. "_scene"), arg_8_0.sceneName, LoadSceneMode.Additive, function(arg_10_0, arg_10_1)
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

	arg_15_0.scoreUI = arg_15_0._tf:Find("ScoreUI")

	setActive(arg_15_0.scoreUI, false)

	arg_15_0.endUI = arg_15_0._tf:Find("EndUI")

	setActive(arg_15_0.endUI, false)

	arg_15_0.resultUI = arg_15_0._tf:Find("ResultUI")

	setActive(arg_15_0.resultUI, false)
	setText(arg_15_0.resultUI:Find("AgainBtn/Text"), i18n("dorm3d_minigame_again"))
	setText(arg_15_0.resultUI:Find("CloseBtn/Text"), i18n("dorm3d_minigame_close"))

	local var_15_0 = arg_15_0._tf:Find("Debug")

	setActive(var_15_0, false)

	arg_15_0.debugTimelineName = var_15_0:Find("Timeline"):GetComponent(typeof(Text))
	arg_15_0.debugTrackName = var_15_0:Find("Track"):GetComponent(typeof(Text))
end

function var_0_0.BindEvent(arg_16_0)
	onButton(arg_16_0, arg_16_0.gameUI:Find("Title/BackBtn"), function()
		arg_16_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_16_0, arg_16_0.gameUI, function()
		if not arg_16_0.startQTEUI then
			return
		end

		arg_16_0:EndQTE()
	end)
	onButton(arg_16_0, arg_16_0.skipUI:Find("SkipBtn"), function()
		setActive(arg_16_0.skipUI, false)
		arg_16_0:StopPlayingTimeline()
		arg_16_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.endUI, function()
		arg_16_0:emit(Dorm3dGameMediatorTemplate.TRIGGER_FAVOR, arg_16_0.apartment.configId)
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.resultUI:Find("AgainBtn"), function()
		setActive(arg_16_0.resultUI, false)
		arg_16_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.resultUI:Find("CloseBtn"), function()
		arg_16_0:closeView()
	end, SFX_CANCEL)
end

function var_0_0.initScene(arg_23_0)
	local var_23_0 = SceneManager.GetSceneByName(arg_23_0.sceneName):GetRootGameObjects()

	table.IpairsCArray(var_23_0, function(arg_24_0, arg_24_1)
		if arg_24_1.name == "[MainBlock]" then
			arg_23_0.modelRoot = tf(arg_24_1):Find("[Model]/scene_root")
			arg_23_0.ballTF = arg_23_0.modelRoot:Find("fbx/litmap05/pre_db_sportinggoods03")
			arg_23_0.ballTF.position = var_0_0.BallInitPos

			setActive(arg_23_0.ballTF, false)
		elseif arg_24_1.name == "MainCamera" then
			arg_23_0.mainCamera = arg_24_1.transform

			setActive(arg_23_0.mainCamera, false)
		elseif arg_24_1.name == "PlayerCamera" then
			arg_23_0.ballCamera = arg_24_1.transform
			arg_23_0.ballCameraComp = arg_23_0.ballCamera:GetComponent(typeof(Camera))

			setActive(arg_23_0.ballCamera, false)
		elseif arg_24_1.name == "TriggerPlane" then
			setActive(arg_24_1, false)

			local var_24_0 = tf(arg_24_1):Find("BallCreate")
			local var_24_1 = var_24_0:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_23_0.ballCreatePlane = Plane.New(var_24_1.normals[0], -Vector3.Dot(var_24_0.position, var_24_1.normals[0]))

			local var_24_2 = tf(arg_24_1):Find("BallQte")
			local var_24_3 = var_24_2:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_23_0.ballQtePlane = Plane.New(var_24_3.normals[0], -Vector3.Dot(var_24_2.position, var_24_3.normals[0]))

			local var_24_4 = tf(arg_24_1):Find("BallMiss")
			local var_24_5 = var_24_4:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_23_0.ballMissPlane = Plane.New(var_24_5.normals[0], -Vector3.Dot(var_24_4.position, var_24_5.normals[0]))
		end
	end)
	arg_23_0:InitLightSettings()

	local var_23_1 = SceneManager.GetSceneByName(arg_23_0.timelineSceneName):GetRootGameObjects()

	arg_23_0.totalDirectorList = {}

	table.IpairsCArray(var_23_1, function(arg_25_0, arg_25_1)
		local var_25_0 = tf(arg_25_1):Find("[sequence]")

		if IsNil(var_25_0) then
			return
		end

		local var_25_1 = var_25_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		var_25_1.playOnAwake = false

		local var_25_2 = var_25_0:GetComponentsInChildren(typeof(UnityEngine.Playables.PlayableDirector))

		for iter_25_0 = 0, var_25_2.Length - 1 do
			var_25_2[iter_25_0].playOnAwake = false
		end

		table.insert(arg_23_0.totalDirectorList, {
			name = arg_25_1.name,
			director = var_25_1
		})
		setActive(arg_25_1, false)
	end)
end

function var_0_0.InitLightSettings(arg_26_0)
	arg_26_0.globalVolume = GameObject.Find("GlobalVolume")
	arg_26_0.characterLight = GameObject.Find("CharacterLight")

	local var_26_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_26_0:GetComponentsInChildren(typeof(Light)), function(arg_27_0, arg_27_1)
		arg_27_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.didEnter(arg_28_0)
	arg_28_0:InitData()
	setActive(arg_28_0.skipUI, true)
	arg_28_0:PlayTimeline({
		name = arg_28_0:GetWeightTimeline("jinchang")
	}, function()
		if not arg_28_0.playingFlag then
			setActive(arg_28_0.skipUI, false)
			arg_28_0:StartGame()
		end
	end)
end

function var_0_0.InitData(arg_30_0)
	return
end

function var_0_0.PlayTimeline(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0:StopPlayingTimeline()

	local var_31_0 = {}
	local var_31_1 = arg_31_1.name
	local var_31_2 = arg_31_1.track
	local var_31_3 = _.detect(arg_31_0.totalDirectorList, function(arg_32_0)
		return arg_32_0.name == var_31_1
	end)

	assert(var_31_3, "Missing director " .. var_31_1)

	if not var_31_3 then
		existCall(arg_31_2)

		return
	end

	arg_31_0.playingDirector = var_31_3.director

	local var_31_4 = arg_31_0.playingDirector.transform

	arg_31_0.debugTimelineName.text = var_31_4.parent.name

	table.insert(var_31_0, function(arg_33_0)
		if arg_31_1.time then
			arg_31_0.playingDirector.time = math.clamp(arg_31_1.time, 0, arg_31_0.playingDirector.duration)
		end

		arg_31_0.bindingConfig = arg_31_0.bindingConfig or _.reduce(pg.dorm3d_timeline_dynamic_binding, {}, function(arg_34_0, arg_34_1)
			if arg_34_1.track_name then
				arg_34_0[arg_34_1.track_name] = arg_34_1.object_name
			end

			return arg_34_0
		end)

		eachChild(arg_31_0.playingDirector, function(arg_35_0)
			local var_35_0 = arg_35_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

			if not var_35_0 then
				return
			end

			table.IpairsCArray(TimelineHelper.GetTimelineTracks(var_35_0), function(arg_36_0, arg_36_1)
				if arg_31_0.bindingConfig[arg_36_1.name] then
					local var_36_0 = GameObject.Find(arg_31_0.bindingConfig[arg_36_1.name])

					if var_36_0 then
						TimelineHelper.SetSceneBinding(var_35_0, arg_36_1, var_36_0)
					else
						warning(string.format("轨道%s需要绑定的物体%s不存在", arg_36_1.name, arg_31_0.bindingConfig[arg_36_1.name]))
					end
				end
			end)
		end)

		local var_33_0 = {}

		GetOrAddComponent(var_31_4, "DftCommonSignalReceiver"):SetCommonEvent(function(arg_37_0)
			switch(arg_37_0.stringParameter, {
				TimelineRandomTrack = function()
					arg_31_0:DoTimelineRandomTrack(arg_31_0.playingDirector)
				end,
				TimelineLoop = function()
					arg_31_0.playingDirector.time = arg_37_0.floatParameter
				end,
				TimelineEnd = function()
					var_33_0.finish = true

					arg_31_0.playingDirector:Stop()
					setActive(tf(arg_31_0.playingDirector).parent, false)
				end
			}, function()
				warning("other event trigger:" .. arg_37_0.stringParameter)
			end)

			if var_33_0.finish then
				arg_31_0.timelineMark = var_33_0
				arg_31_0.debugTimelineName.text = ""
				arg_31_0.debugTrackName.text = ""

				arg_33_0()
			end
		end)
		arg_31_0.playingDirector:Evaluate()
		arg_31_0:DoTimelineRandomTrack(arg_31_0.playingDirector)
		setActive(tf(arg_31_0.playingDirector).parent, true)
		arg_31_0.playingDirector:Play()
		setActive(arg_31_0.mainCamera, false)

		if arg_31_0.activeDirectorInfo then
			arg_31_0.lastDirectorInfo = arg_31_0.activeDirectorInfo
		end

		arg_31_0.activeDirectorInfo = var_31_3
	end)
	seriesAsync(var_31_0, function()
		setActive(arg_31_0.mainCamera, true)

		arg_31_0.playingDirector = nil

		local var_42_0 = arg_31_0.timelineMark

		arg_31_0.timelineMark = nil

		existCall(arg_31_2, var_42_0)
	end)
end

function var_0_0.StopPlayingTimeline(arg_43_0)
	if arg_43_0.playingDirector then
		arg_43_0.playingDirector:Stop()
		setActive(tf(arg_43_0.playingDirector).parent, false)

		arg_43_0.debugTimelineName.text = ""
		arg_43_0.debugTrackName.text = ""

		setActive(arg_43_0.mainCamera, true)
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

	local var_44_1 = var_44_0:GetComponent(typeof(DftAniEvent))

	var_44_1:SetEndEvent(function()
		setActive(var_44_0, false)
		arg_44_0:StartOneRound()
		setActive(arg_44_0.gameUI:Find("Score"), true)
		var_44_1:SetEndEvent(nil)
	end)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_1)
end

function var_0_0.UpdateGameScore(arg_46_0)
	setText(arg_46_0.ourScoreTF, arg_46_0.ourScore)
	setText(arg_46_0.otherScoreTF, arg_46_0.otherScore)
end

function var_0_0.UpdateScoreTpl(arg_47_0, arg_47_1)
	setText(arg_47_1:Find("Left/Tens/Text"), 0)
	setText(arg_47_1:Find("Left/Units/Text"), arg_47_0.ourScore % 10)
	setText(arg_47_1:Find("Right/Tens/Text"), 0)
	setText(arg_47_1:Find("Right/Units/Text"), arg_47_0.otherScore % 10)
end

function var_0_0.StartOneRound(arg_48_0)
	arg_48_0:UpdateGameScore()

	arg_48_0.roundEndFlag = false
	arg_48_0.roundResult = nil

	seriesAsync({
		function(arg_49_0)
			arg_48_0:FaQiuOP(arg_49_0)
		end,
		function(arg_50_0)
			arg_48_0:OneQTE()
		end
	})
end

function var_0_0.OneQTE(arg_51_0)
	seriesAsync({
		function(arg_52_0)
			arg_51_0:StartQTE(arg_52_0)
		end,
		function(arg_53_0)
			switch(arg_51_0.qteResult, {
				[var_0_0.QTE_RESULT.MISS] = function()
					arg_51_0:QteMissOP(function()
						arg_51_0.roundEndFlag = true
						arg_51_0.roundResult = var_0_0.ROUND_RESULT.OTHER_WIN

						arg_53_0()
					end)
				end,
				[var_0_0.QTE_RESULT.HIT] = function()
					arg_51_0:QteHitOP(arg_53_0)
				end,
				[var_0_0.QTE_RESULT.PERFECT] = function()
					arg_51_0:QtePerfectOP(function()
						arg_51_0.roundEndFlag = true
						arg_51_0.roundResult = var_0_0.ROUND_RESULT.OUR_WIN

						arg_53_0()
					end)
				end
			}, function()
				assert(false, "unknow qte result" .. arg_51_0.qteResult)
			end)
		end
	}, function()
		if not arg_51_0.roundEndFlag then
			arg_51_0:OneQTE()
		else
			arg_51_0:EndOneRound()
		end
	end)
end

function var_0_0.EndOneRound(arg_61_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_6)

	local var_61_0 = arg_61_0.scoreUI:GetComponent(typeof(DftAniEvent))

	var_61_0:SetEndEvent(function()
		quickPlayAnimation(arg_61_0.scoreUI, "Anim_Dorm3d_volleyball_score_out")
		onDelayTick(function()
			setActive(arg_61_0.scoreUI, false)
		end, 0.1)

		if arg_61_0:CheckEndGame() then
			arg_61_0:EndGame()
		else
			setActive(arg_61_0.gameUI, true)
			arg_61_0:StartOneRound()
		end

		var_61_0:SetEndEvent(nil)
	end)
	setActive(arg_61_0.gameUI, false)
	arg_61_0:UpdateScoreTpl(arg_61_0.scoreUI:Find("ScoreTpl"))
	setText(arg_61_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_61_0.ourScore % 10)
	setText(arg_61_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_61_0.otherScore % 10)
	switch(arg_61_0.roundResult, {
		[var_0_0.ROUND_RESULT.OUR_WIN] = function()
			arg_61_0.ourScore = arg_61_0.ourScore + 1

			setText(arg_61_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_61_0.ourScore % 10)
			setActive(arg_61_0.scoreUI, true)
			quickPlayAnimation(arg_61_0.scoreUI, "Anim_Dorm3d_volleyball_score_leftin")
		end,
		[var_0_0.ROUND_RESULT.OTHER_WIN] = function()
			arg_61_0.otherScore = arg_61_0.otherScore + 1

			setText(arg_61_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_61_0.otherScore % 10)
			setActive(arg_61_0.scoreUI, true)
			quickPlayAnimation(arg_61_0.scoreUI, "Anim_Dorm3d_volleyball_score_rightin")
		end
	}, function()
		assert(false, "unknow round result" .. arg_61_0.roundResult)
	end)
end

function var_0_0.CheckEndGame(arg_67_0)
	if arg_67_0.ourScore >= var_0_0.endScore then
		arg_67_0.gameResult = var_0_0.GAME_RESULT.VICTORY

		return true
	end

	if arg_67_0.otherScore >= var_0_0.endScore then
		arg_67_0.gameResult = var_0_0.GAME_RESULT.DEFEAT

		return true
	end

	return false
end

function var_0_0.EndGame(arg_68_0)
	if arg_68_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
		pg.CriMgr.GetInstance():PlaySE_V3(var_0_7)
	end

	seriesAsync({
		function(arg_69_0)
			local var_69_0 = arg_68_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "shibai" or "shengli"

			arg_68_0:PlayTimeline({
				name = arg_68_0:GetWeightTimeline(var_69_0)
			}, arg_69_0)
		end
	}, function()
		arg_68_0:PlayTimeline({
			name = arg_68_0:GetWeightTimeline("daiji")
		}, function()
			return
		end)
		setActive(arg_68_0.endUI, true)
		setActive(arg_68_0.endUI:Find("Title/Victory"), arg_68_0.gameResult == var_0_0.GAME_RESULT.VICTORY)
		setActive(arg_68_0.endUI:Find("Title/Defeat"), arg_68_0.gameResult == var_0_0.GAME_RESULT.DEFEAT)
		arg_68_0:UpdateScoreTpl(arg_68_0.endUI:Find("ScoreTpl"))
	end)
end

function var_0_0.ShowResultUI(arg_72_0, arg_72_1)
	(function()
		local var_73_0 = arg_72_0.contextData.roomId
		local var_73_1 = arg_72_0.contextData.groupId or 20220
		local var_73_2 = arg_72_0.contextData.groupIds or {
			var_73_1
		}
		local var_73_3 = table.concat(var_73_2, ",")
		local var_73_4 = arg_72_0.ourScore .. ":" .. arg_72_0.otherScore

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataRoom(var_73_0, 8, var_73_3, var_73_4))
	end)()
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_8)
	seriesAsync({
		function(arg_74_0)
			quickPlayAnimation(arg_72_0.endUI, "Anim_Dorm3d_volleyball_end_out")
			onDelayTick(function()
				setActive(arg_72_0.endUI, false)
			end, 0.1)

			if arg_72_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
				arg_72_0:PlayTimeline({
					name = arg_72_0:GetWeightTimeline("jiangli")
				}, arg_74_0)
			else
				arg_72_0:StopPlayingTimeline()
				arg_74_0()
			end
		end
	}, function()
		gcAll(true)
		setActive(arg_72_0.resultUI, true)

		local var_76_0

		var_76_0 = arg_72_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "Victory" or "Defeat"

		setText(arg_72_0.resultUI:Find("Panel/Text"), i18n("volleyball_end_tip"))

		if arg_72_1 then
			setActive(arg_72_0.resultUI:Find("Panel/Award"), true)
			setText(arg_72_0.resultUI:Find("Panel/Award/Text"), i18n("volleyball_end_award", arg_72_1.cost, arg_72_1.delta))
		else
			setActive(arg_72_0.resultUI:Find("Panel/Award"), false)
		end
	end)
end

function var_0_0.FaQiuOP(arg_77_0, arg_77_1)
	arg_77_0:PlayTimeline({
		name = arg_77_0:GetWeightTimeline("faqiu")
	}, arg_77_1)
end

function var_0_0.StartQTE(arg_78_0, arg_78_1)
	arg_78_0.qteCallback = arg_78_1

	setActive(arg_78_0.ballCamera, true)
	setActive(arg_78_0.mainCamera, false)

	arg_78_0.randomScreenPos = Vector2(math.random(var_0_0.BallRandomDelat.Left, Screen.width - var_0_0.BallRandomDelat.Right), math.random(var_0_0.BallRandomDelat.Bottom, Screen.height - var_0_0.BallRandomDelat.Top))

	local var_78_0 = arg_78_0.ballCameraComp:ScreenPointToRay(arg_78_0.randomScreenPos)

	arg_78_0.randomScale = math.random(var_0_0.perfectScaleRandoms[1] * 10, arg_78_0.perfectScaleRandoms[2] * 10) / 10

	local var_78_1 = (var_0_0.perfectRadiusMax + var_0_0.perfectRadiusMin) / 2 * arg_78_0.randomScale / var_0_0.triggerRadius
	local var_78_2 = arg_78_0.ballQtePlane.distance + (arg_78_0.ballMissPlane.distance - arg_78_0.ballQtePlane.distance) * (1 - var_78_1)
	local var_78_3, var_78_4 = Plane.New(arg_78_0.ballQtePlane.normal, var_78_2):Raycast(var_78_0)

	assert(var_78_3, "retPerfect plane not in view")

	arg_78_0.ballDir = (var_78_0:GetPoint(var_78_4) - var_0_0.BallInitPos):Normalize()

	local var_78_5 = Ray.New(arg_78_0.ballDir, var_0_0.BallInitPos)
	local var_78_6, var_78_7 = arg_78_0.ballQtePlane:Raycast(var_78_5)

	assert(var_78_6, "qte plane not in view")

	local var_78_8 = var_78_5:GetPoint(var_78_7)
	local var_78_9, var_78_10 = arg_78_0.ballMissPlane:Raycast(var_78_5)

	assert(var_78_9, "miss plane not in view")

	local var_78_11 = var_78_5:GetPoint(var_78_10)
	local var_78_12 = 0

	arg_78_0.qteUITime = (var_78_8 - var_78_11):Magnitude() / var_0_0.BallQTESpeed
	arg_78_0.ballTimer = Timer.New(function()
		if var_78_12 >= var_78_10 then
			arg_78_0.ballTimer:Stop()

			arg_78_0.ballTimer = nil

			setActive(arg_78_0.ballTF, false)

			arg_78_0.ballTF.position = var_0_0.BallInitPos

			if arg_78_0.startQTEUI then
				setLocalScale(arg_78_0.qteTriggerTF, {
					x = 0,
					y = 0
				})
				arg_78_0:EndQTE(var_0_0.QTE_RESULT.MISS)
			end
		elseif var_78_12 >= var_78_7 then
			var_78_12 = var_78_12 + var_0_0.BallQTESpeed
			arg_78_0.ballTF.position = var_78_5:GetPoint(var_78_12)

			if not arg_78_0.startQTEUI then
				arg_78_0:StartQTEUI()
			end

			arg_78_0.curScale = arg_78_0.curScale - 1 / arg_78_0.qteUITime

			setLocalScale(arg_78_0.qteTriggerTF, {
				x = arg_78_0.curScale,
				y = arg_78_0.curScale
			})

			arg_78_0.curRadius = var_0_0.triggerRadius * arg_78_0.curScale

			if arg_78_0.curScale < 0 then
				arg_78_0:EndQTE()
			end
		else
			var_78_12 = var_78_12 + var_0_0.BallSpeed
			arg_78_0.ballTF.position = var_78_5:GetPoint(var_78_12)
		end
	end, 0.016666666666666666, -1)

	setActive(arg_78_0.ballTF, true)
	arg_78_0.ballTimer:Start()
end

function var_0_0.StartQTEUI(arg_80_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_2)
	setLocalScale(arg_80_0.qteTriggerTF, {
		x = 1,
		y = 1
	})
	eachChild(arg_80_0.qteTF:Find("animroot/Result"), function(arg_81_0)
		setActive(arg_81_0, false)
	end)

	arg_80_0.qteResult = nil
	arg_80_0.curRadius = var_0_0.triggerRadius
	arg_80_0.curPerfectRadiusMax = var_0_0.perfectRadiusMax * arg_80_0.randomScale
	arg_80_0.curPerfectRadiusMin = var_0_0.perfectRadiusMin * arg_80_0.randomScale

	setLocalScale(arg_80_0.qteTF:Find("animroot/Perfect"), {
		x = arg_80_0.randomScale,
		y = arg_80_0.randomScale
	})

	arg_80_0.curScale = 1

	setLocalPosition(arg_80_0.qteTF, LuaHelper.ScreenToLocal(arg_80_0.qteTF.parent, arg_80_0.randomScreenPos, pg.UIMgr.GetInstance().uiCameraComp))
	setActive(arg_80_0.qteTF, true)

	arg_80_0.startQTEUI = true
end

function var_0_0.EndQTE(arg_82_0, arg_82_1)
	arg_82_0.startQTEUI = nil

	setActive(arg_82_0.mainCamera, true)
	setActive(arg_82_0.ballCamera, false)

	if arg_82_1 then
		arg_82_0.qteResult = arg_82_1
	elseif arg_82_0.curRadius < var_0_0.hitRadiusMin or arg_82_0.curRadius > var_0_0.hitRadiusMax then
		arg_82_0.qteResult = var_0_0.QTE_RESULT.MISS
	elseif arg_82_0.curRadius <= arg_82_0.curPerfectRadiusMax and arg_82_0.curRadius >= arg_82_0.curPerfectRadiusMin then
		arg_82_0.qteResult = var_0_0.QTE_RESULT.PERFECT
	else
		arg_82_0.qteResult = var_0_0.QTE_RESULT.HIT
	end

	eachChild(arg_82_0.qteTF:Find("animroot/Result"), function(arg_83_0)
		setActive(arg_83_0, arg_83_0.name == arg_82_0.qteResult)
	end)

	if arg_82_0.ballTimer then
		arg_82_0.ballTimer:Stop()

		arg_82_0.ballTimer = nil

		setActive(arg_82_0.ballTF, false)

		arg_82_0.ballTF.position = var_0_0.BallInitPos
	end

	if arg_82_0.qteCallback then
		arg_82_0.qteCallback()

		arg_82_0.qteCallback = nil
	end

	onDelayTick(function()
		setActive(arg_82_0.qteTF, false)
	end, 1)
end

function var_0_0.QteMissOP(arg_85_0, arg_85_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_5)
	arg_85_0:PlayTimeline({
		name = arg_85_0:GetWeightTimeline("shiqiu")
	}, arg_85_1)
end

function var_0_0.QteHitOP(arg_86_0, arg_86_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_3)
	seriesAsync({
		function(arg_87_0)
			arg_86_0:PlayTimeline({
				name = arg_86_0:GetWeightTimeline("fly")
			}, arg_87_0)
		end,
		function(arg_88_0)
			arg_86_0:PlayTimeline({
				name = arg_86_0:GetWeightTimeline("jieqiu")
			}, arg_88_0)
		end
	}, arg_86_1)
end

function var_0_0.QtePerfectOP(arg_89_0, arg_89_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_4)
	seriesAsync({
		function(arg_90_0)
			arg_89_0:PlayTimeline({
				name = arg_89_0:GetWeightTimeline("max_fly")
			}, arg_90_0)
		end,
		function(arg_91_0)
			arg_89_0:PlayTimeline({
				name = arg_89_0:GetWeightTimeline("shouji")
			}, arg_91_0)
		end
	}, arg_89_1)
end

function var_0_0.GetWeightTimeline(arg_92_0, arg_92_1)
	local var_92_0 = arg_92_0.volleyballCfg[arg_92_1]

	assert(var_92_0 ~= "", "volleyball cfg is empty string" .. arg_92_1)
	assert(#var_92_0 ~= 0, "volleyball cfg is empty table:" .. arg_92_1)

	local var_92_1 = underscore.reduce(var_92_0, 0, function(arg_93_0, arg_93_1)
		return arg_93_0 + arg_93_1[2]
	end)
	local var_92_2 = math.random() * var_92_1
	local var_92_3 = 0

	for iter_92_0, iter_92_1 in ipairs(var_92_0) do
		var_92_3 = var_92_3 + iter_92_1[2]

		if var_92_2 <= var_92_3 then
			return iter_92_1[1]
		end
	end
end

function var_0_0.DoTimelineRandomTrack(arg_94_0, arg_94_1)
	local var_94_0 = {}
	local var_94_1 = TimelineHelper.GetTimelineTracks(arg_94_1)

	for iter_94_0 = 0, var_94_1.Length - 1 do
		local var_94_2 = var_94_1[iter_94_0]

		if var_94_2.name ~= "Markers" then
			var_94_2.muted = true

			table.insert(var_94_0, var_94_2)
		end
	end

	if #var_94_0 > 0 then
		local var_94_3 = var_94_0[math.random(#var_94_0)]

		underscore.each(var_94_0, function(arg_95_0)
			if arg_95_0.name == var_94_3.name then
				arg_95_0.muted = false
			end
		end)

		arg_94_0.debugTrackName.text = var_94_3.name
	else
		arg_94_0.debugTrackName.text = "track cnt 0"
	end
end

function var_0_0.OnPause(arg_96_0)
	if arg_96_0.ballTimer then
		arg_96_0.ballTimer:Stop()
	end

	if arg_96_0.playingDirector then
		arg_96_0.playingDirector:Pause()
	end
end

function var_0_0.OnResume(arg_97_0)
	if arg_97_0.ballTimer then
		arg_97_0.ballTimer:Start()
	end

	if arg_97_0.playingDirector then
		arg_97_0.playingDirector:Play()
	end
end

function var_0_0.onBackPressed(arg_98_0)
	if not arg_98_0.playingFlag or isActive(arg_98_0.gameUI:Find("Count")) or isActive(arg_98_0.endUI) then
		return
	end

	arg_98_0:OnPause()
	pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_MSGBOX, {
		contentText = i18n("sure_exit_volleyball"),
		onConfirm = function()
			arg_98_0:emit(var_0_0.ON_BACK)
		end,
		onClose = function()
			arg_98_0:OnResume()
		end
	})
end

function var_0_0.willExit(arg_101_0)
	arg_101_0.loader:Clear()

	if arg_101_0.ballTimer then
		arg_101_0.ballTimer:Stop()

		arg_101_0.ballTimer = nil
	end

	local var_101_0 = {
		{
			path = string.lower("dorm3d/character/" .. arg_101_0.timelineSceneRootName .. "/timeline/" .. arg_101_0.timelineSceneName .. "/" .. arg_101_0.timelineSceneName .. "_scene"),
			name = arg_101_0.timelineSceneName
		},
		{
			path = string.lower("dorm3d/scenesres/scenes/common/" .. arg_101_0.sceneRootName .. "/" .. arg_101_0.sceneName .. "_scene"),
			name = arg_101_0.sceneName
		}
	}
	local var_101_1 = underscore.map(var_101_0, function(arg_102_0)
		return function(arg_103_0)
			SceneOpMgr.Inst:UnloadSceneAsync(arg_102_0.path, arg_102_0.name, arg_103_0)
		end
	end)

	seriesAsync(var_101_1, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

return var_0_0
