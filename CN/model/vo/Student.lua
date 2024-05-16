local var_0_0 = class("Student", import(".BaseVO"))

var_0_0.WAIT = 1
var_0_0.ATTEND = 2
var_0_0.CANCEL_TYPE_AUTO = 0
var_0_0.CANCEL_TYPE_MANUAL = 1
var_0_0.CANCEL_TYPE_QUICKLY = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id or arg_1_1.room_id
	arg_1_0.skillId = arg_1_1.skill_pos
	arg_1_0.skillIdIndex = nil
	arg_1_0.lessonId = arg_1_1.lessonId
	arg_1_0.shipId = arg_1_1.ship_id
	arg_1_0.finishTime = arg_1_1.finish_time
	arg_1_0.startTime = arg_1_1.start_time
	arg_1_0.time = arg_1_1.time
	arg_1_0.exp = arg_1_1.exp
	arg_1_0.state = arg_1_1.state or var_0_0.ATTEND
end

function var_0_0.updateSkillId(arg_2_0, arg_2_1)
	arg_2_0.skillId = arg_2_1
end

function var_0_0.setSkillIndex(arg_3_0, arg_3_1)
	arg_3_0.skillIdIndex = arg_3_1
end

function var_0_0.getSkillId(arg_4_0, arg_4_1)
	if arg_4_0.skillId then
		return arg_4_0.skillId
	else
		return arg_4_1:getSkillList()[arg_4_0.skillIdIndex]
	end
end

function var_0_0.setLesson(arg_5_0, arg_5_1)
	arg_5_0.lessonId = arg_5_1
end

function var_0_0.setFinishTime(arg_6_0, arg_6_1)
	arg_6_0.finishTime = arg_6_1
end

function var_0_0.setTime(arg_7_0, arg_7_1)
	arg_7_0.time = arg_7_1
end

function var_0_0.getTime(arg_8_0)
	return arg_8_0.time or arg_8_0.finishTime - arg_8_0.startTime
end

function var_0_0.getFinishTime(arg_9_0)
	return arg_9_0.finishTime
end

function var_0_0.getState(arg_10_0)
	return arg_10_0.state
end

function var_0_0.getSkillDesc(arg_11_0, arg_11_1, arg_11_2)
	return (getSkillDescLearn(arg_11_0, arg_11_1, arg_11_2))
end

function var_0_0.getSkillName(arg_12_0)
	local var_12_0 = getProxy(BayProxy):getShipById(arg_12_0.shipId)

	return getSkillName(arg_12_0:getSkillId(var_12_0))
end

function var_0_0.getShipVO(arg_13_0)
	return (getProxy(BayProxy):getShipById(arg_13_0.shipId))
end

return var_0_0
