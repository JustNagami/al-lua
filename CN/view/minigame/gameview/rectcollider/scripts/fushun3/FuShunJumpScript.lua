slot0 = class("FuShunJumpScript", import("..RectBaseScript"))

slot0.onInit = function(slot0)
	slot0._loop = false
	slot0._active = false
	slot0._weight = 2
	slot0._scriptTime = 0
end

slot0.onStep = function(slot0)
	if slot0._active then
		slot1 = slot0._collisionInfo:getVelocity()

		if slot0._collisionInfo.below and slot0._collisionInfo.useJumpTimes == 0 then
			slot1.y = slot0._collisionInfo.config.maxJumpVelocity
			slot0._collisionInfo.useJumpTimes = 1

			if slot0._event then
				slot0._event:emit(Fushun3GameView.JUMP_EVENT)
			end
		end

		slot0._collisionInfo:setVelocity(slot1)
	end
end

slot0.onLateStep = function(slot0)
	if slot0._collisionInfo.below and slot0._collisionInfo.useJumpTimes == 1 then
		slot0._collisionInfo.useJumpTimes = 0
	end
end

slot0.onTrigger = function(slot0)
	if Application.isEditor and slot0._triggerKey == KeyCode.Space and slot0:checkScirptApply() then
		slot0._active = true
	end
end

return slot0
