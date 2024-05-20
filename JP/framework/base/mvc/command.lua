ys = ys or {}

local var_0_0 = ys

var_0_0.MVC = var_0_0.MVC or {}
var_0_0.MVC.Command = class("MVC.Command")
var_0_0.MVC.Command.__name = "MVC.Command"

function var_0_0.MVC.Command.Ctor(arg_1_0)
	return
end

function var_0_0.MVC.Command.Initialize(arg_2_0)
	var_0_0.EventDispatcher.AttachEventDispatcher(arg_2_0)
	var_0_0.EventListener.AttachEventListener(arg_2_0)
end

function var_0_0.MVC.Command.Update(arg_3_0)
	return
end

function var_0_0.MVC.Command.Dispose(arg_4_0)
	var_0_0.EventListener.DetachEventListener(arg_4_0)
	var_0_0.EventDispatcher.DetachEventDispatcher(arg_4_0)
end

function var_0_0.MVC.Command.GetState(arg_5_0)
	return arg_5_0._state
end
