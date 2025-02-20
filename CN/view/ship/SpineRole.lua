local var_0_0 = class("SpineRole")

var_0_0.STATE_EMPTY = 0
var_0_0.STATE_LOADING = 1
var_0_0.STATE_INITED = 2
var_0_0.STATE_DISPOSE = 3

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.state = var_0_0.STATE_EMPTY

	if arg_1_1 then
		arg_1_0.ship = arg_1_1
		arg_1_0.prefabName = arg_1_0.ship:getPrefab()
	end
end

function var_0_0.SetData(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.prefabName = arg_2_1
	arg_2_0.attachmentData = arg_2_2
end

var_0_0.ORBIT_KEY_UI = "orbit_ui"
var_0_0.ORBIT_KEY_SLG = "orbit_slg"

function var_0_0.Load(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_2 == nil then
		arg_3_2 = true
	end

	PoolMgr.GetInstance():GetSpineChar(arg_3_0.prefabName, arg_3_2, function(arg_4_0)
		assert(arg_4_0, "没有这个角色的模型  " .. arg_3_0.prefabName)

		if arg_3_0.state == var_0_0.STATE_DISPOSE then
			PoolMgr.GetInstance():ReturnSpineChar(arg_3_0.prefabName, arg_4_0)
		else
			arg_3_0.modelRoot = GameObject.New(arg_3_0.prefabName .. "_root")

			arg_3_0.modelRoot:AddComponent(typeof(RectTransform))

			arg_3_0.model = arg_4_0
			arg_3_0.model.transform.localScale = Vector3.one

			arg_3_0.model.transform:SetParent(arg_3_0.modelRoot.transform, false)

			arg_3_0.model.transform.localPosition = Vector3.zero

			arg_3_0:Init()

			if arg_3_1 then
				arg_3_1()
			end

			arg_3_0:AttachOrbit(arg_3_3)
			arg_3_0:sortAttachmentGO()
		end
	end)
end

function var_0_0.Init(arg_5_0)
	arg_5_0.state = var_0_0.STATE_INITED
	arg_5_0._modleGraphic = arg_5_0.model:GetComponent("SkeletonGraphic")
	arg_5_0._modleAnim = arg_5_0.model:GetComponent("SpineAnimUI")
	arg_5_0._attachmentList = {}
	arg_5_0._visible = true
end

function var_0_0.AttachOrbit(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1 or var_0_0.ORBIT_KEY_UI
	local var_6_1 = arg_6_0:GetAttachmentList()

	for iter_6_0, iter_6_1 in pairs(var_6_1) do
		local var_6_2 = iter_6_1.config
		local var_6_3 = iter_6_1.index
		local var_6_4 = var_6_2[var_6_0]

		if var_6_0 ~= var_0_0.ORBIT_KEY_UI and var_6_4 == "" then
			var_6_4 = var_6_2.orbit_ui
			var_6_0 = var_0_0.ORBIT_KEY_UI
		end

		if var_6_4 ~= "" then
			local var_6_5 = ys.Battle.BattleResourceManager.GetOrbitPath(var_6_4)

			ResourceMgr.Inst:getAssetAsync(var_6_5, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_7_0)
				if arg_6_0.state == var_0_0.STATE_DISPOSE then
					-- block empty
				else
					local var_7_0 = var_6_0 .. "_bound"
					local var_7_1 = var_6_2[var_7_0][1]
					local var_7_2 = var_6_2[var_7_0][2]
					local var_7_3 = Object.Instantiate(arg_7_0)
					local var_7_4 = var_7_3:GetComponentsInChildren(typeof(Spine.Unity.SkeletonGraphic))

					for iter_7_0 = 1, var_7_4.Length do
						var_7_4[iter_7_0 - 1].raycastTarget = false
					end

					var_7_3.transform.localPosition = Vector2(var_7_2[1], var_7_2[2])

					local var_7_5 = SpineAnimUI.AddFollower(var_7_1, arg_6_0.model.transform, var_7_3.transform)

					var_7_3.transform.localScale = Vector3.one
					arg_6_0._attachmentList[var_7_5] = {
						p = var_6_4,
						hiddenActionList = var_6_2.orbit_hidden_action,
						index = var_6_3,
						back = var_6_2.orbit_ui_back
					}

					local var_7_6 = var_7_5:GetComponent("Spine.Unity.BoneFollowerGraphic")

					if var_6_2.orbit_rotate then
						var_7_6.followBoneRotation = true

						local var_7_7 = var_7_3.transform.localEulerAngles

						var_7_3.transform.localEulerAngles = Vector3(var_7_7.x, var_7_7.y, var_7_7.z - 90)
					else
						var_7_6.followBoneRotation = false
					end

					if var_6_2.orbit_ui_back == 1 then
						var_7_5:SetParent(arg_6_0.modelRoot.transform, false)
						var_7_5:SetAsFirstSibling()
					else
						var_7_5:SetParent(arg_6_0.modelRoot.transform, false)
						var_7_5:SetAsLastSibling()
					end

					SetActive(var_7_5, arg_6_0._visible)
					arg_6_0:sortAttachmentGO()
				end
			end), true, true)
		end
	end
end

function var_0_0.sortAttachmentGO(arg_8_0)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in pairs(arg_8_0._attachmentList) do
		table.insert(var_8_0, {
			tf = iter_8_0,
			index = iter_8_1.index,
			back = iter_8_1.back,
			p = iter_8_1.p
		})
	end

	table.sort(var_8_0, function(arg_9_0, arg_9_1)
		return arg_9_0.index < arg_9_1.index
	end)

	for iter_8_2, iter_8_3 in ipairs(var_8_0) do
		if iter_8_3.back ~= 1 then
			iter_8_3.tf:SetAsLastSibling()

			break
		end
	end
end

function var_0_0.GetAttachmentList(arg_10_0)
	if arg_10_0.ship then
		return arg_10_0.ship:getAttachmentPrefab()
	else
		return arg_10_0.attachmentData or {}
	end
end

function var_0_0.CheckInited(arg_11_0)
	return arg_11_0.state == var_0_0.STATE_INITED
end

function var_0_0.GetName(arg_12_0)
	return arg_12_0.modelRoot.name
end

function var_0_0.SetParent(arg_13_0, arg_13_1)
	if arg_13_0:CheckInited() then
		SetParent(arg_13_0.modelRoot, arg_13_1, false)
	end
end

function var_0_0.SetRaycastTarget(arg_14_0, arg_14_1)
	if arg_14_0:CheckInited() then
		arg_14_0._modleGraphic.raycastTarget = arg_14_1
	end
end

function var_0_0.ModifyName(arg_15_0, arg_15_1)
	if arg_15_0:CheckInited() then
		arg_15_0.modelRoot.name = arg_15_1
	end
end

function var_0_0.SetVisible(arg_16_0, arg_16_1)
	if arg_16_0:CheckInited() then
		arg_16_0._visible = arg_16_1
		arg_16_0._modleGraphic.color = Color.New(1, 1, 1, arg_16_1 and 1 or 0)

		for iter_16_0, iter_16_1 in pairs(arg_16_0._attachmentList) do
			SetActive(iter_16_0, arg_16_1)
		end
	end
end

function var_0_0.SetAction(arg_17_0, arg_17_1)
	if not arg_17_0:CheckInited() then
		return
	end

	arg_17_0._modleAnim:SetAction(arg_17_1, 0)
	arg_17_0:HiddenAttachmentByAction(arg_17_1)
end

function var_0_0.SetActionOnce(arg_18_0, arg_18_1)
	if not arg_18_0:CheckInited() then
		return
	end

	arg_18_0._modleGraphic.AnimationState:SetAnimation(0, arg_18_1, false)
	arg_18_0:HiddenAttachmentByAction(arg_18_1)
end

function var_0_0.SetActionCallBack(arg_19_0, arg_19_1)
	if not arg_19_0:CheckInited() then
		return
	end

	arg_19_0._modleAnim:SetActionCallBack(arg_19_1)
end

function var_0_0.HiddenAttachmentByAction(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in pairs(arg_20_0._attachmentList) do
		SetActive(iter_20_0, not table.contains(iter_20_1.hiddenActionList, arg_20_1))
	end
end

function var_0_0.SetSizeDelta(arg_21_0, arg_21_1)
	if arg_21_0:CheckInited() then
		rtf(arg_21_0.modelRoot).sizeDelta = arg_21_1
	end
end

function var_0_0.SetLocalScale(arg_22_0, arg_22_1)
	if arg_22_0:CheckInited() then
		arg_22_0.modelRoot.transform.localScale = arg_22_1
	end
end

function var_0_0.SetLocalPos(arg_23_0, arg_23_1)
	if arg_23_0:CheckInited() then
		arg_23_0.modelRoot.transform.localPosition = arg_23_1
	end
end

function var_0_0.SetLayer(arg_24_0, arg_24_1)
	if arg_24_0:CheckInited() then
		pg.ViewUtils.SetLayer(arg_24_0.modelRoot.transform, arg_24_1)
	end
end

function var_0_0.TweenShining(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5, arg_25_6, arg_25_7, arg_25_8, arg_25_9, arg_25_10)
	if arg_25_0:CheckInited() then
		arg_25_0:StopTweenShining()

		local var_25_0 = arg_25_0._modleGraphic.material
		local var_25_1 = LeanTween.value(arg_25_0.modelRoot, arg_25_3, arg_25_4, arg_25_1):setEase(LeanTweenType.easeInOutSine):setOnUpdate(System.Action_float(function(arg_26_0)
			if arg_25_7 then
				var_25_0:SetColor("_Color", Color.Lerp(arg_25_5, arg_25_6, arg_26_0))
			else
				arg_25_0._modleGraphic.color = Color.Lerp(arg_25_5, arg_25_6, arg_26_0)
			end

			existCall(arg_25_9, arg_26_0)
		end)):setOnComplete(System.Action(function()
			arg_25_0._tweenShiningId = nil

			if arg_25_8 then
				if arg_25_7 then
					var_25_0:SetColor("_Color", arg_25_5)
				else
					arg_25_0._modleGraphic.color = arg_25_5
				end
			end

			existCall(arg_25_10)
		end))

		if arg_25_2 then
			var_25_1:setLoopPingPong(arg_25_2)
		end

		arg_25_0._tweenShiningId = var_25_1.uniqueId
	end
end

function var_0_0.StopTweenShining(arg_28_0)
	if arg_28_0:CheckInited() and arg_28_0._tweenShiningId then
		LeanTween.cancel(arg_28_0._tweenShiningId, true)

		arg_28_0._tweenShiningId = nil
	end
end

function var_0_0.ChangeMaterial(arg_29_0, arg_29_1)
	if not arg_29_0:CheckInited() then
		return
	end

	if not arg_29_0._stageMaterial then
		arg_29_0._stageMaterial = arg_29_0._modleGraphic.material
	end

	arg_29_0._modleGraphic.material = arg_29_1
end

function var_0_0.RevertMaterial(arg_30_0)
	if not arg_30_0:CheckInited() then
		return
	end

	if not arg_30_0._stageMaterial then
		return
	end

	arg_30_0._modleGraphic.material = arg_30_0._stageMaterial
end

function var_0_0.CreateInterface(arg_31_0)
	arg_31_0._mouseChild = GameObject("mouseChild")

	arg_31_0._mouseChild.transform:SetParent(arg_31_0.modelRoot.transform, false)

	arg_31_0._mouseChild.transform.localPosition = Vector3.zero
	arg_31_0._modelClick = GetOrAddComponent(arg_31_0._mouseChild, "ModelDrag")
	arg_31_0._modelPress = GetOrAddComponent(arg_31_0._mouseChild, "UILongPressTrigger")
	arg_31_0._dragDelegate = GetOrAddComponent(arg_31_0._mouseChild, "EventTriggerListener")

	arg_31_0._modelClick:Init()

	local var_31_0 = GetOrAddComponent(arg_31_0._mouseChild, typeof(RectTransform))

	var_31_0.pivot = Vector2(0.5, 0)
	var_31_0.anchoredPosition = Vector2(0, 0)
	var_31_0.localScale = Vector2(100, 100)
	var_31_0.sizeDelta = Vector2(3, 3)

	return arg_31_0._modelClick, arg_31_0._modelPress, arg_31_0._dragDelegate
end

function var_0_0.resumeRole(arg_32_0)
	if arg_32_0._modleAnim and arg_32_0._modleAnim:GetAnimationState() then
		arg_32_0._modleAnim:Resume()
	end
end

function var_0_0.GetInterface(arg_33_0)
	return arg_33_0._modelClick, arg_33_0._modelPress, arg_33_0._dragDelegate
end

function var_0_0.EnableInterface(arg_34_0)
	arg_34_0._mouseChild:GetComponent(typeof(Image)).enabled = true
end

function var_0_0.DisableInterface(arg_35_0)
	arg_35_0._mouseChild:GetComponent(typeof(Image)).enabled = false
end

function var_0_0.Dispose(arg_36_0)
	if arg_36_0.state == var_0_0.STATE_INITED then
		arg_36_0:StopTweenShining()
		arg_36_0:RevertMaterial()
		PoolMgr.GetInstance():ReturnSpineChar(arg_36_0.prefabName, arg_36_0.model)
		arg_36_0:SetVisible(true)
		arg_36_0._modleGraphic.material:SetColor("_Color", Color.New(0, 0, 0, 0))

		arg_36_0._modleGraphic.color = Color.New(1, 1, 1, 1)

		for iter_36_0, iter_36_1 in pairs(arg_36_0._attachmentList) do
			Object.Destroy(iter_36_0.gameObject)
		end

		arg_36_0.model = nil
		arg_36_0.prefabName = nil
		arg_36_0.ship = nil
		arg_36_0.attachmentData = nil
		arg_36_0._modleGraphic = nil
		arg_36_0._modleAnim = nil
		arg_36_0._attachmentList = nil
	end

	arg_36_0.state = var_0_0.STATE_DISPOSE
end

return var_0_0
