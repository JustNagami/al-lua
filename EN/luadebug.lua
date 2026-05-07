local var_0_0
local var_0_1
local var_0_2 = require
local var_0_3
local var_0_4

if loadstring then
	var_0_4 = loadstring
else
	var_0_4 = load
end

local var_0_5 = setfenv or function(arg_1_0, arg_1_1)
	local var_1_0 = 1

	while true do
		local var_1_1 = debug.getupvalue(arg_1_0, var_1_0)

		if var_1_1 == "_ENV" then
			debug.upvaluejoin(arg_1_0, var_1_0, function()
				return arg_1_1
			end, 1)

			break
		elseif not var_1_1 then
			break
		end

		var_1_0 = var_1_0 + 1
	end

	return arg_1_0
end
local var_0_6 = {}
local var_0_7

if LuaDebugTool then
	var_0_7 = LuaDebugTool
elseif CS and CS.LuaDebugTool then
	var_0_7 = CS.LuaDebugTool
end

local var_0_8 = var_0_7
local var_0_9 = var_0_4
local var_0_10 = debug.getinfo

local function var_0_11()
	local var_3_0 = _G
	local var_3_1 = require("string")
	local var_3_2 = require("math")
	local var_3_3 = require("socket.core")
	local var_3_4 = var_3_3

	function var_3_4.connect4(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
		return var_3_3.connect(arg_4_0, arg_4_1, arg_4_2, arg_4_3, "inet")
	end

	function var_3_4.connect6(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
		return var_3_3.connect(arg_5_0, arg_5_1, arg_5_2, arg_5_3, "inet6")
	end

	if not var_3_4.connect then
		function var_3_4.connect(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
			local var_6_0, var_6_1 = var_3_3.tcp()

			if not var_6_0 then
				return nil, var_6_1
			end

			if arg_6_2 then
				local var_6_2, var_6_3 = var_6_0:bind(arg_6_2, arg_6_3, -1)

				if not var_6_2 then
					return nil, var_6_3
				end
			end

			local var_6_4, var_6_5 = var_6_0:connect(arg_6_0, arg_6_1)

			if not var_6_4 then
				return nil, var_6_5
			end

			return var_6_0
		end
	end

	function var_3_4.bind(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == "*" then
			arg_7_0 = "0.0.0.0"
		end

		local var_7_0, var_7_1 = var_3_3.dns.getaddrinfo(arg_7_0)

		if not var_7_0 then
			return nil, var_7_1
		end

		local var_7_2
		local var_7_3
		local var_7_4 = "no info on address"

		for iter_7_0, iter_7_1 in var_3_0.ipairs(var_7_0) do
			if iter_7_1.family == "inet" then
				var_7_2, var_7_4 = var_3_3.tcp4()
			else
				var_7_2, var_7_4 = var_3_3.tcp6()
			end

			if not var_7_2 then
				return nil, var_7_4
			end

			var_7_2:setoption("reuseaddr", true)

			local var_7_5, var_7_6 = var_7_2:bind(iter_7_1.addr, arg_7_1)

			var_7_4 = var_7_6

			if not var_7_5 then
				var_7_2:close()
			else
				local var_7_7, var_7_8 = var_7_2:listen(arg_7_2)

				var_7_4 = var_7_8

				if not var_7_7 then
					var_7_2:close()
				else
					return var_7_2
				end
			end
		end

		return nil, var_7_4
	end

	var_3_4.try = var_3_4.newtry()

	function var_3_4.choose(arg_8_0)
		return function(arg_9_0, arg_9_1, arg_9_2)
			if var_3_0.type(arg_9_0) ~= "string" then
				arg_9_0, arg_9_1, arg_9_2 = "default", arg_9_0, arg_9_1
			end

			local var_9_0 = arg_8_0[arg_9_0 or "nil"]

			if not var_9_0 then
				var_3_0.error("unknown key (" .. var_3_0.tostring(arg_9_0) .. ")", 3)
			else
				return var_9_0(arg_9_1, arg_9_2)
			end
		end
	end

	local var_3_5 = {}
	local var_3_6 = {}

	var_3_4.sourcet = var_3_5
	var_3_4.sinkt = var_3_6
	var_3_4.BLOCKSIZE = 2048
	var_3_6["close-when-done"] = function(arg_10_0)
		return var_3_0.setmetatable({
			getfd = function()
				return arg_10_0:getfd()
			end,
			dirty = function()
				return arg_10_0:dirty()
			end
		}, {
			__call = function(arg_13_0, arg_13_1, arg_13_2)
				if not arg_13_1 then
					arg_10_0:close()

					return 1
				else
					return arg_10_0:send(arg_13_1)
				end
			end
		})
	end
	var_3_6["keep-open"] = function(arg_14_0)
		return var_3_0.setmetatable({
			getfd = function()
				return arg_14_0:getfd()
			end,
			dirty = function()
				return arg_14_0:dirty()
			end
		}, {
			__call = function(arg_17_0, arg_17_1, arg_17_2)
				if arg_17_1 then
					return arg_14_0:send(arg_17_1)
				else
					return 1
				end
			end
		})
	end
	var_3_6.default = var_3_6["keep-open"]
	var_3_4.sink = var_3_4.choose(var_3_6)
	var_3_5["by-length"] = function(arg_18_0, arg_18_1)
		return var_3_0.setmetatable({
			getfd = function()
				return arg_18_0:getfd()
			end,
			dirty = function()
				return arg_18_0:dirty()
			end
		}, {
			__call = function()
				if arg_18_1 <= 0 then
					return nil
				end

				local var_21_0 = var_3_2.min(var_3_3.BLOCKSIZE, arg_18_1)
				local var_21_1, var_21_2 = arg_18_0:receive(var_21_0)

				if var_21_2 then
					return nil, var_21_2
				end

				arg_18_1 = arg_18_1 - var_3_1.len(var_21_1)

				return var_21_1
			end
		})
	end
	var_3_5["until-closed"] = function(arg_22_0)
		local var_22_0

		return var_3_0.setmetatable({
			getfd = function()
				return arg_22_0:getfd()
			end,
			dirty = function()
				return arg_22_0:dirty()
			end
		}, {
			__call = function()
				if var_22_0 then
					return nil
				end

				local var_25_0, var_25_1, var_25_2 = arg_22_0:receive(var_3_3.BLOCKSIZE)

				if not var_25_1 then
					return var_25_0
				elseif var_25_1 == "closed" then
					arg_22_0:close()

					var_22_0 = 1

					return var_25_2
				else
					return nil, var_25_1
				end
			end
		})
	end
	var_3_5.default = var_3_5["until-closed"]
	var_3_4.source = var_3_4.choose(var_3_5)

	return var_3_4
end

local function var_0_12()
	local var_26_0 = require("math")
	local var_26_1 = require("string")
	local var_26_2 = require("table")
	local var_26_3
	local var_26_4 = {}
	local var_26_5 = {}

	var_26_4.EMPTY_ARRAY = {}
	var_26_4.EMPTY_OBJECT = {}

	local var_26_6
	local var_26_7
	local var_26_8
	local var_26_9
	local var_26_10
	local var_26_11
	local var_26_12
	local var_26_13
	local var_26_14
	local var_26_15

	function var_26_4.encode(arg_27_0)
		if arg_27_0 == nil then
			return "null"
		end

		local var_27_0 = type(arg_27_0)

		if var_27_0 == "string" then
			return "\"" .. var_26_5.encodeString(arg_27_0) .. "\""
		end

		if var_27_0 == "number" or var_27_0 == "boolean" then
			return tostring(arg_27_0)
		end

		if var_27_0 == "table" then
			local var_27_1 = {}
			local var_27_2, var_27_3 = var_26_14(arg_27_0)

			if var_27_2 then
				for iter_27_0 = 1, var_27_3 do
					var_26_2.insert(var_27_1, var_26_4.encode(arg_27_0[iter_27_0]))
				end
			else
				for iter_27_1, iter_27_2 in pairs(arg_27_0) do
					if var_26_15(iter_27_1) and var_26_15(iter_27_2) then
						var_26_2.insert(var_27_1, "\"" .. var_26_5.encodeString(iter_27_1) .. "\":" .. var_26_4.encode(iter_27_2))
					end
				end
			end

			if var_27_2 then
				return "[" .. var_26_2.concat(var_27_1, ",") .. "]"
			else
				return "{" .. var_26_2.concat(var_27_1, ",") .. "}"
			end
		end

		if var_27_0 == "function" and arg_27_0 == var_26_4.null then
			return "null"
		end

		assert(false, "encode attempt to encode unsupported type " .. var_27_0 .. ":" .. tostring(arg_27_0))
	end

	function var_26_4.decode(arg_28_0, arg_28_1)
		arg_28_1 = arg_28_1 and arg_28_1 or 1
		arg_28_1 = var_26_12(arg_28_0, arg_28_1)

		assert(arg_28_1 <= var_26_1.len(arg_28_0), "Unterminated JSON encoded object found at position in [" .. arg_28_0 .. "]")

		local var_28_0 = var_26_1.sub(arg_28_0, arg_28_1, arg_28_1)

		if var_28_0 == "{" then
			return var_26_10(arg_28_0, arg_28_1)
		end

		if var_28_0 == "[" then
			return var_26_6(arg_28_0, arg_28_1)
		end

		if var_26_1.find("+-0123456789.e", var_28_0, 1, true) then
			return var_26_9(arg_28_0, arg_28_1)
		end

		if var_28_0 == "\"" or var_28_0 == "'" then
			return var_26_11(arg_28_0, arg_28_1)
		end

		if var_26_1.sub(arg_28_0, arg_28_1, arg_28_1 + 1) == "/*" then
			return var_26_4.decode(arg_28_0, var_26_7(arg_28_0, arg_28_1))
		end

		return var_26_8(arg_28_0, arg_28_1)
	end

	function var_26_4.null()
		return var_26_4.null
	end

	function var_26_6(arg_30_0, arg_30_1)
		local var_30_0 = {}
		local var_30_1 = var_26_1.len(arg_30_0)

		assert(var_26_1.sub(arg_30_0, arg_30_1, arg_30_1) == "[", "decode_scanArray called but array does not start at position " .. arg_30_1 .. " in string:\n" .. arg_30_0)

		arg_30_1 = arg_30_1 + 1

		repeat
			arg_30_1 = var_26_12(arg_30_0, arg_30_1)

			assert(arg_30_1 <= var_30_1, "JSON String ended unexpectedly scanning array.")

			local var_30_2 = var_26_1.sub(arg_30_0, arg_30_1, arg_30_1)

			if var_30_2 == "]" then
				return var_30_0, arg_30_1 + 1
			end

			if var_30_2 == "," then
				arg_30_1 = var_26_12(arg_30_0, arg_30_1 + 1)
			end

			assert(arg_30_1 <= var_30_1, "JSON String ended unexpectedly scanning array.")

			var_26_3, arg_30_1 = var_26_4.decode(arg_30_0, arg_30_1)

			var_26_2.insert(var_30_0, var_26_3)
		until false
	end

	function var_26_7(arg_31_0, arg_31_1)
		assert(var_26_1.sub(arg_31_0, arg_31_1, arg_31_1 + 1) == "/*", "decode_scanComment called but comment does not start at position " .. arg_31_1)

		local var_31_0 = var_26_1.find(arg_31_0, "*/", arg_31_1 + 2)

		assert(var_31_0 ~= nil, "Unterminated comment in string at " .. arg_31_1)

		return var_31_0 + 2
	end

	function var_26_8(arg_32_0, arg_32_1)
		local var_32_0 = {
			["true"] = true,
			["false"] = false
		}
		local var_32_1 = {
			"true",
			"false",
			"null"
		}

		for iter_32_0, iter_32_1 in pairs(var_32_1) do
			if var_26_1.sub(arg_32_0, arg_32_1, arg_32_1 + var_26_1.len(iter_32_1) - 1) == iter_32_1 then
				return var_32_0[iter_32_1], arg_32_1 + var_26_1.len(iter_32_1)
			end
		end

		assert(nil, "Failed to scan constant from string " .. arg_32_0 .. " at starting position " .. arg_32_1)
	end

	function var_26_9(arg_33_0, arg_33_1)
		local var_33_0 = arg_33_1 + 1
		local var_33_1 = var_26_1.len(arg_33_0)
		local var_33_2 = "+-0123456789.e"

		while var_26_1.find(var_33_2, var_26_1.sub(arg_33_0, var_33_0, var_33_0), 1, true) and var_33_0 <= var_33_1 do
			var_33_0 = var_33_0 + 1
		end

		local var_33_3 = "return " .. var_26_1.sub(arg_33_0, arg_33_1, var_33_0 - 1)
		local var_33_4 = var_0_9(var_33_3)

		assert(var_33_4, "Failed to scan number [ " .. var_33_3 .. "] in JSON string at position " .. arg_33_1 .. " : " .. var_33_0)

		return var_33_4(), var_33_0
	end

	function var_26_10(arg_34_0, arg_34_1)
		local var_34_0 = {}
		local var_34_1 = var_26_1.len(arg_34_0)
		local var_34_2
		local var_34_3

		assert(var_26_1.sub(arg_34_0, arg_34_1, arg_34_1) == "{", "decode_scanObject called but object does not start at position " .. arg_34_1 .. " in string:\n" .. arg_34_0)

		arg_34_1 = arg_34_1 + 1

		repeat
			arg_34_1 = var_26_12(arg_34_0, arg_34_1)

			assert(arg_34_1 <= var_34_1, "JSON string ended unexpectedly while scanning object.")

			local var_34_4 = var_26_1.sub(arg_34_0, arg_34_1, arg_34_1)

			if var_34_4 == "}" then
				return var_34_0, arg_34_1 + 1
			end

			if var_34_4 == "," then
				arg_34_1 = var_26_12(arg_34_0, arg_34_1 + 1)
			end

			assert(arg_34_1 <= var_34_1, "JSON string ended unexpectedly scanning object.")

			local var_34_5

			var_34_5, arg_34_1 = var_26_4.decode(arg_34_0, arg_34_1)

			assert(arg_34_1 <= var_34_1, "JSON string ended unexpectedly searching for value of key " .. var_34_5)

			arg_34_1 = var_26_12(arg_34_0, arg_34_1)

			assert(arg_34_1 <= var_34_1, "JSON string ended unexpectedly searching for value of key " .. var_34_5)
			assert(var_26_1.sub(arg_34_0, arg_34_1, arg_34_1) == ":", "JSON object key-value assignment mal-formed at " .. arg_34_1)

			arg_34_1 = var_26_12(arg_34_0, arg_34_1 + 1)

			assert(arg_34_1 <= var_34_1, "JSON string ended unexpectedly searching for value of key " .. var_34_5)

			var_34_0[var_34_5], arg_34_1 = var_26_4.decode(arg_34_0, arg_34_1)
		until false
	end

	local var_26_16 = {
		["\\n"] = "\n",
		["\\t"] = "\t",
		["\\f"] = "\f",
		["\\r"] = "\r",
		["\\b"] = "\b"
	}

	setmetatable(var_26_16, {
		__index = function(arg_35_0, arg_35_1)
			return var_26_1.sub(arg_35_1, 2)
		end
	})

	function var_26_11(arg_36_0, arg_36_1)
		assert(arg_36_1, "decode_scanString(..) called without start position")

		local var_36_0 = var_26_1.sub(arg_36_0, arg_36_1, arg_36_1)

		assert(var_36_0 == "\"" or var_36_0 == "'", "decode_scanString called for a non-string")

		local var_36_1 = {}
		local var_36_2 = arg_36_1
		local var_36_3 = arg_36_1

		while var_26_1.find(arg_36_0, var_36_0, var_36_3 + 1) ~= var_36_3 + 1 do
			local var_36_4 = var_36_3
			local var_36_5

			var_36_5, var_36_3 = var_26_1.find(arg_36_0, "\\.", var_36_3 + 1)

			local var_36_6, var_36_7 = var_26_1.find(arg_36_0, var_36_0, var_36_4 + 1)

			if not var_36_5 or var_36_6 < var_36_5 then
				var_36_5, var_36_3 = var_36_6, var_36_7 - 1
			end

			var_26_2.insert(var_36_1, var_26_1.sub(arg_36_0, var_36_4 + 1, var_36_5 - 1))

			if var_26_1.sub(arg_36_0, var_36_5, var_36_3) == "\\u" then
				local var_36_8 = var_26_1.sub(arg_36_0, var_36_3 + 1, var_36_3 + 4)

				var_36_3 = var_36_3 + 4

				local var_36_9 = tonumber(var_36_8, 16)

				assert(var_36_9, "String decoding failed: bad Unicode escape " .. var_36_8 .. " at position " .. var_36_5 .. " : " .. var_36_3)

				local var_36_10

				if var_36_9 < 128 then
					var_36_10 = var_26_1.char(var_36_9 % 128)
				elseif var_36_9 < 2048 then
					var_36_10 = var_26_1.char(192 + var_26_0.floor(var_36_9 / 64) % 32, 128 + var_36_9 % 64)
				else
					var_36_10 = var_26_1.char(224 + var_26_0.floor(var_36_9 / 4096) % 16, 128 + var_26_0.floor(var_36_9 / 64) % 64, 128 + var_36_9 % 64)
				end

				var_26_2.insert(var_36_1, var_36_10)
			else
				var_26_2.insert(var_36_1, var_26_16[var_26_1.sub(arg_36_0, var_36_5, var_36_3)])
			end
		end

		var_26_2.insert(var_36_1, var_26_1.sub(var_36_3, var_36_3 + 1))
		assert(var_26_1.find(arg_36_0, var_36_0, var_36_3 + 1), "String decoding failed: missing closing " .. var_36_0 .. " at position " .. var_36_3 .. "(for string at position " .. arg_36_1 .. ")")

		return var_26_2.concat(var_36_1, ""), var_36_3 + 2
	end

	function var_26_12(arg_37_0, arg_37_1)
		local var_37_0 = " \n\r\t"
		local var_37_1 = var_26_1.len(arg_37_0)

		while var_26_1.find(var_37_0, var_26_1.sub(arg_37_0, arg_37_1, arg_37_1), 1, true) and arg_37_1 <= var_37_1 do
			arg_37_1 = arg_37_1 + 1
		end

		return arg_37_1
	end

	local var_26_17 = {
		["\f"] = "\\f",
		["\b"] = "\\b",
		["\\"] = "\\\\",
		["/"] = "\\/",
		["\""] = "\\\"",
		["\n"] = "\\n",
		["\r"] = "\\r",
		["\t"] = "\\t"
	}

	function var_26_5.encodeString(arg_38_0)
		return tostring(arg_38_0):gsub(".", function(arg_39_0)
			return var_26_17[arg_39_0]
		end)
	end

	function var_26_14(arg_40_0)
		if arg_40_0 == var_26_4.EMPTY_ARRAY then
			return true, 0
		end

		if arg_40_0 == var_26_4.EMPTY_OBJECT then
			return false
		end

		local var_40_0 = 0

		for iter_40_0, iter_40_1 in pairs(arg_40_0) do
			if type(iter_40_0) == "number" and var_26_0.floor(iter_40_0) == iter_40_0 and iter_40_0 >= 1 then
				if not var_26_15(iter_40_1) then
					return false
				end

				var_40_0 = var_26_0.max(var_40_0, iter_40_0)
			elseif iter_40_0 == "n" then
				if iter_40_1 ~= (arg_40_0.n or #arg_40_0) then
					return false
				end
			elseif var_26_15(iter_40_1) then
				return false
			end
		end

		return true, var_40_0
	end

	function var_26_15(arg_41_0)
		local var_41_0 = type(arg_41_0)

		return var_41_0 == "string" or var_41_0 == "boolean" or var_41_0 == "number" or var_41_0 == "nil" or var_41_0 == "table" or var_41_0 == "function" and arg_41_0 == var_26_4.null
	end

	return var_26_4
end

local var_0_13 = print
local var_0_14
local var_0_15
local var_0_16 = var_0_12()
local var_0_17 = {
	StepIn = false,
	StepNext = false,
	isHook = true,
	isDebugPrint = true,
	Run = true,
	StepOut = false,
	currentFileName = "",
	StepInLevel = 0,
	DebugLuaFie = "",
	hookType = "lrc",
	isFoxGloryProject = false,
	StepNextLevel = 0,
	version = "1.0.7",
	isProntToConsole = 1,
	fileMaps = {},
	breakInfos = {},
	pathCachePaths = {},
	splitFilePaths = {}
}
local var_0_18
local var_0_19 = coroutine.resume

function coroutine.resume(arg_42_0, ...)
	if var_0_17.isHook and coroutine.status(arg_42_0) ~= "dead" then
		debug.sethook(arg_42_0, var_0_18, "lrc")
	end

	return var_0_19(arg_42_0, ...)
end

var_0_17.event = {
	C2S_StepOutResponse = 13,
	C2S_NextResponseOver = 9,
	S2C_SetBreakPoints = 1,
	C2S_NextResponse = 8,
	S2C_ReqVar = 5,
	C2S_DebugXpCall = 20,
	C2S_LuaPrint = 14,
	C2S_ReqVar = 6,
	C2S_LoadLuaScript = 18,
	S2C_DebugClose = 21,
	S2C_LoadLuaScript = 16,
	S2C_NextRequest = 7,
	C2S_HITBreakPoint = 4,
	C2S_SetBreakPoints = 2,
	S2C_StepOutRequest = 12,
	S2C_StepInRequest = 10,
	C2S_StepInResponse = 11,
	S2C_RUN = 3,
	C2S_SetSocketName = 17
}

function print(...)
	if var_0_17.isProntToConsole == 1 or var_0_17.isProntToConsole == 3 then
		var_0_13(...)
	end

	if (var_0_17.isProntToConsole == 1 or var_0_17.isProntToConsole == 2) and var_0_14 then
		local var_43_0 = {
			...
		}
		local var_43_1 = ""

		if #var_43_0 == 0 then
			var_43_0 = {
				"nil"
			}
		end

		for iter_43_0, iter_43_1 in pairs(var_43_0) do
			var_43_1 = var_43_1 .. tostring(iter_43_1) .. "\t"
		end

		local var_43_2 = {
			event = var_0_17.event.C2S_LuaPrint,
			data = {
				type = 1,
				msg = var_0_6.encode(var_43_1)
			}
		}
		local var_43_3 = var_0_16.encode(var_43_2)

		var_0_14:send(var_43_3 .. "__debugger_k0204__")
	end
end

function luaIdePrintWarn(...)
	if var_0_17.isProntToConsole == 1 or var_0_17.isProntToConsole == 3 then
		var_0_13(...)
	end

	if (var_0_17.isProntToConsole == 1 or var_0_17.isProntToConsole == 2) and var_0_14 then
		local var_44_0 = {
			...
		}
		local var_44_1 = ""

		if #var_44_0 == 0 then
			var_44_0 = {
				"nil"
			}
		end

		for iter_44_0, iter_44_1 in pairs(var_44_0) do
			var_44_1 = var_44_1 .. tostring(iter_44_1) .. "\t"
		end

		local var_44_2 = {
			event = var_0_17.event.C2S_LuaPrint,
			data = {
				type = 2,
				msg = var_0_6.encode(var_44_1)
			}
		}
		local var_44_3 = var_0_16.encode(var_44_2)

		var_0_14:send(var_44_3 .. "__debugger_k0204__")
	end
end

function luaIdePrintErr(...)
	if var_0_17.isProntToConsole == 1 or var_0_17.isProntToConsole == 3 then
		var_0_13(...)
	end

	if (var_0_17.isProntToConsole == 1 or var_0_17.isProntToConsole == 2) and var_0_14 then
		local var_45_0 = {
			...
		}
		local var_45_1 = ""

		if #var_45_0 == 0 then
			var_45_0 = {
				"nil"
			}
		end

		for iter_45_0, iter_45_1 in pairs(var_45_0) do
			var_45_1 = var_45_1 .. tostring(iter_45_1) .. "\t"
		end

		local var_45_2 = {
			event = var_0_17.event.C2S_LuaPrint,
			data = {
				type = 3,
				msg = var_0_6.encode(var_45_1)
			}
		}
		local var_45_3 = var_0_16.encode(var_45_2)

		var_0_14:send(var_45_3 .. "__debugger_k0204__")
	end
end

local function var_0_20(arg_46_0, arg_46_1)
	local var_46_0 = string.find(arg_46_0, arg_46_1, 1)

	while var_46_0 do
		local var_46_1 = string.find(arg_46_0, arg_46_1, var_46_0 + 1)

		if not var_46_1 then
			break
		else
			var_46_0 = var_46_1
		end
	end

	return var_46_0
end

local function var_0_21(arg_47_0)
	local var_47_0, var_47_1 = string.find(arg_47_0, "/%.%./")

	if var_47_0 then
		local var_47_2 = string.sub(arg_47_0, 1, var_47_0 - 1)
		local var_47_3 = var_0_20(var_47_2, "/")
		local var_47_4 = string.sub(var_47_2, 1, var_47_3 - 1)
		local var_47_5 = string.sub(arg_47_0, var_47_1)

		arg_47_0 = var_47_4 .. var_47_5
		arg_47_0 = var_0_21(arg_47_0)

		return arg_47_0
	else
		return arg_47_0
	end
end

local function var_0_22(arg_48_0)
	local var_48_0
	local var_48_1

	arg_48_0 = arg_48_0:gsub("\\", "/")
	arg_48_0 = arg_48_0:gsub("//", "/")
	arg_48_0 = arg_48_0:gsub("/./", "/")

	if arg_48_0:find("@") == 1 then
		arg_48_0 = arg_48_0:sub(2)
	end

	if arg_48_0:find("%./") == 1 then
		arg_48_0 = arg_48_0:sub(3)
	end

	arg_48_0 = var_0_21(arg_48_0)

	local var_48_2 = string.len(arg_48_0)
	local var_48_3 = {
		".lua",
		".txt.lua",
		".txt",
		".bytes"
	}

	table.sort(var_48_3, function(arg_49_0, arg_49_1)
		return string.len(arg_49_0) > string.len(arg_49_1)
	end)

	local var_48_4 = {}

	for iter_48_0, iter_48_1 in ipairs(var_48_3) do
		table.insert(var_48_4, string.len(iter_48_1))
	end

	local var_48_5 = string.len(arg_48_0)

	for iter_48_2, iter_48_3 in ipairs(var_48_3) do
		if string.sub(arg_48_0, var_48_5 - var_48_4[iter_48_2] + 1) == iter_48_3 then
			arg_48_0 = string.sub(arg_48_0, 1, var_48_5 - var_48_4[iter_48_2])

			break
		end
	end

	local var_48_6 = var_0_20(arg_48_0, "/")

	if var_48_6 then
		var_48_0 = string.sub(arg_48_0, var_48_6 + 1)
		var_48_1 = string.sub(arg_48_0, 1, var_48_6)
		arg_48_0 = var_48_1 .. var_48_0
	else
		local var_48_7 = var_0_20(arg_48_0, "%.")

		if not var_48_7 then
			var_48_0 = arg_48_0
			var_48_1 = ""
		else
			var_48_1 = string.sub(arg_48_0, 1, var_48_7)
			var_48_1 = var_48_1:gsub("%.", "/")
			var_48_0 = string.sub(arg_48_0, var_48_7 + 1)
			arg_48_0 = var_48_1 .. var_48_0
		end
	end

	return arg_48_0, var_48_1, var_48_0
end

local function var_0_23(arg_50_0, arg_50_1)
	arg_50_0 = tostring(arg_50_0)
	arg_50_1 = tostring(arg_50_1)

	if arg_50_1 == "" then
		return false
	end

	local var_50_0 = 0
	local var_50_1 = {}

	for iter_50_0, iter_50_1 in function()
		return string.find(arg_50_0, arg_50_1, var_50_0, true)
	end do
		table.insert(var_50_1, string.sub(arg_50_0, var_50_0, iter_50_0 - 1))

		var_50_0 = iter_50_1 + 1
	end

	table.insert(var_50_1, string.sub(arg_50_0, var_50_0))

	return var_50_1
end

local function var_0_24(arg_52_0)
	arg_52_0 = string.gsub(arg_52_0, "^[ \t\n\r]+", "")

	return string.gsub(arg_52_0, "[ \t\n\r]+$", "")
end

local function var_0_25(arg_53_0, arg_53_1, arg_53_2)
	if type(arg_53_2) ~= "number" then
		arg_53_2 = 3
	end

	local var_53_0 = {}
	local var_53_1 = {}

	local function var_53_2(arg_54_0)
		if type(arg_54_0) == "string" then
			arg_54_0 = "\"" .. arg_54_0 .. "\""
		end

		return tostring(arg_54_0)
	end

	local var_53_3 = var_0_23(debug.traceback("", 2), "\n")

	print("dump from: " .. var_0_24(var_53_3[3]))

	local function var_53_4(arg_55_0, arg_55_1, arg_55_2, arg_55_3, arg_55_4)
		arg_55_1 = arg_55_1 or "<var>"

		local var_55_0 = ""

		if type(arg_55_4) == "number" then
			var_55_0 = string.rep(" ", arg_55_4 - string.len(var_53_2(arg_55_1)))
		end

		if type(arg_55_0) ~= "table" then
			var_53_1[#var_53_1 + 1] = string.format("%s%s%s = %s", arg_55_2, var_53_2(arg_55_1), var_55_0, var_53_2(arg_55_0))
		elseif var_53_0[arg_55_0] then
			var_53_1[#var_53_1 + 1] = string.format("%s%s%s = *REF*", arg_55_2, arg_55_1, var_55_0)
		else
			var_53_0[arg_55_0] = true

			if arg_55_3 > arg_53_2 then
				var_53_1[#var_53_1 + 1] = string.format("%s%s = *MAX NESTING*", arg_55_2, arg_55_1)
			else
				var_53_1[#var_53_1 + 1] = string.format("%s%s = {", arg_55_2, var_53_2(arg_55_1))

				local var_55_1 = arg_55_2 .. "    "
				local var_55_2 = {}
				local var_55_3 = 0
				local var_55_4 = {}

				for iter_55_0, iter_55_1 in pairs(arg_55_0) do
					var_55_2[#var_55_2 + 1] = iter_55_0

					local var_55_5 = var_53_2(iter_55_0)
					local var_55_6 = string.len(var_55_5)

					if var_55_3 < var_55_6 then
						var_55_3 = var_55_6
					end

					var_55_4[iter_55_0] = iter_55_1
				end

				table.sort(var_55_2, function(arg_56_0, arg_56_1)
					if type(arg_56_0) == "number" and type(arg_56_1) == "number" then
						return arg_56_0 < arg_56_1
					else
						return tostring(arg_56_0) < tostring(arg_56_1)
					end
				end)

				for iter_55_2, iter_55_3 in ipairs(var_55_2) do
					var_53_4(var_55_4[iter_55_3], iter_55_3, var_55_1, arg_55_3 + 1, var_55_3)
				end

				var_53_1[#var_53_1 + 1] = string.format("%s}", arg_55_2)
			end
		end
	end

	var_53_4(arg_53_0, arg_53_1, "- ", 1)

	for iter_53_0, iter_53_1 in ipairs(var_53_1) do
		print(iter_53_1)
	end
end

local function var_0_26(arg_57_0, arg_57_1)
	local var_57_0 = type(arg_57_1)
	local var_57_1 = ""

	if var_57_0 ~= "table" then
		var_57_1 = tostring(arg_57_1)
		var_57_1 = var_0_6.encode(var_57_1)
	elseif var_0_17.isFoxGloryProject then
		var_57_1 = var_0_6.encode("table")
	else
		local var_57_2, var_57_3 = xpcall(function()
			var_57_1 = tostring(arg_57_1)
			var_57_1 = var_0_6.encode(var_57_1)
		end, function(arg_59_0)
			var_57_1 = var_0_6.encode("table")
		end)
	end

	return {
		name = arg_57_0,
		valueType = var_57_0,
		valueStr = var_57_1
	}
end

local function var_0_27(arg_60_0)
	local var_60_0 = 1
	local var_60_1 = {}

	while true do
		local var_60_2, var_60_3 = debug.getlocal(arg_60_0, var_60_0)

		if not var_60_2 then
			break
		end

		if var_60_2 ~= "(*temporary)" then
			var_60_1[var_60_2] = var_60_3
		end

		var_60_0 = var_60_0 + 1
	end

	local var_60_4 = var_0_10(arg_60_0, "f").func
	local var_60_5 = 1
	local var_60_6 = {}

	while var_60_4 do
		local var_60_7, var_60_8 = debug.getupvalue(var_60_4, var_60_5)

		if not var_60_7 then
			break
		end

		if var_60_7 == "_ENV" then
			var_60_6._ENV_ = var_60_8
		else
			var_60_6[var_60_7] = var_60_8
		end

		var_60_5 = var_60_5 + 1
	end

	return {
		locals = var_60_1,
		ups = var_60_6
	}
end

local function var_0_28(arg_61_0, arg_61_1)
	local var_61_0 = {}
	local var_61_1 = {}
	local var_61_2 = {}
	local var_61_3 = {}
	local var_61_4 = 0

	for iter_61_0 = arg_61_0, 100 do
		local var_61_5 = var_0_10(iter_61_0)
		local var_61_6 = true

		if iter_61_0 == arg_61_0 then
			local var_61_7 = var_61_5.source

			if var_61_7:find(var_0_17.DebugLuaFie) then
				return
			end

			if var_61_7 == "=[C]" then
				var_61_6 = false
			end
		end

		if not var_61_5 then
			break
		end

		if var_61_6 then
			local var_61_8, var_61_9, var_61_10 = var_0_22(var_61_5.source)
			local var_61_11 = {
				src = var_61_8,
				scoreName = var_61_5.name,
				currentline = var_61_5.currentline,
				linedefined = var_61_5.linedefined,
				what = var_61_5.what,
				nameWhat = var_61_5.namewhat
			}
			local var_61_12 = iter_61_0
			local var_61_13 = var_0_27(iter_61_0 + 1)

			table.insert(var_61_1, var_61_11)
			table.insert(var_61_2, var_61_13)
			table.insert(var_61_3, var_61_5.func)
		end

		if var_61_5.what == "main" then
			break
		end
	end

	local var_61_14 = {
		stack = var_61_1,
		vars = var_61_2,
		funcs = var_61_3
	}
	local var_61_15 = {
		stack = var_61_14.stack,
		vars = var_61_14.vars,
		funcs = var_61_14.funcs,
		event = arg_61_1,
		funcsLength = #var_61_14.funcs
	}

	var_0_17.currentTempFunc = var_61_15.funcs[1]

	return var_61_15
end

local var_0_29

local function var_0_30()
	if jit and var_0_17.debugLuaType ~= "jit" then
		local var_62_0 = "当前luajit版本为: " .. jit.version .. " 请使用LuaDebugjit 进行调试!"

		print(var_62_0)
	end

	if var_0_15 then
		local var_62_1, var_62_2 = var_0_15:receive()

		if var_62_1 then
			local var_62_3 = var_0_16.decode(var_62_1)

			if var_62_3.event == var_0_17.event.S2C_SetBreakPoints then
				var_0_29(var_62_3.data)
			elseif var_62_3.event == var_0_17.event.S2C_LoadLuaScript then
				var_0_3(var_62_3.data, false)
			end
		end
	end
end

local function var_0_31(arg_63_0)
	if var_0_17.splitFilePaths[arg_63_0] then
		return var_0_17.splitFilePaths[arg_63_0]
	end

	local var_63_0 = 0
	local var_63_1 = {}

	for iter_63_0, iter_63_1 in function()
		return string.find(arg_63_0, "/", var_63_0, true)
	end do
		local var_63_2 = string.sub(arg_63_0, var_63_0, iter_63_0 - 1)

		table.insert(var_63_1, var_63_2)

		var_63_0 = iter_63_1 + 1
	end

	local var_63_3 = string.sub(arg_63_0, var_63_0)

	table.insert(var_63_1, var_63_3)

	var_0_17.splitFilePaths[arg_63_0] = var_63_1

	return var_63_1
end

function var_0_29(arg_65_0)
	local var_65_0 = var_0_17.breakInfos

	for iter_65_0, iter_65_1 in ipairs(arg_65_0) do
		iter_65_1.fileName = string.lower(iter_65_1.fileName)
		iter_65_1.serverPath = string.lower(iter_65_1.serverPath)

		local var_65_1 = var_65_0[iter_65_1.fileName]

		if not var_65_1 then
			var_65_0[iter_65_1.fileName] = {}
			var_65_1 = var_65_0[iter_65_1.fileName]
		end

		if not iter_65_1.breakDatas or #iter_65_1.breakDatas == 0 then
			var_65_1[iter_65_1.serverPath] = nil
		else
			local var_65_2 = var_65_1[iter_65_1.serverPath]

			if not var_65_2 then
				var_65_2 = {
					pathNames = var_0_31(iter_65_1.serverPath),
					hitCounts = {}
				}
				var_65_1[iter_65_1.serverPath] = var_65_2
			end

			local var_65_3 = {}

			for iter_65_2, iter_65_3 in ipairs(iter_65_1.breakDatas) do
				var_65_3[iter_65_3.line] = iter_65_3

				if iter_65_3.hitCondition and iter_65_3.hitCondition ~= "" then
					iter_65_3.hitCondition = tonumber(iter_65_3.hitCondition)
				else
					iter_65_3.hitCondition = 0
				end

				if not var_65_2.hitCounts[iter_65_3.line] then
					var_65_2.hitCounts[iter_65_3.line] = 0
				end
			end

			var_65_2.lines = var_65_3

			for iter_65_4, iter_65_5 in pairs(var_65_2.hitCounts) do
				if not var_65_3[iter_65_4] then
					var_65_2.hitCounts[iter_65_4] = nil
				end
			end
		end

		local var_65_4 = 0

		for iter_65_6, iter_65_7 in pairs(var_65_1) do
			var_65_4 = var_65_4 + 1
		end

		if var_65_4 == 0 then
			var_65_0[iter_65_1.fileName] = nil
		end
	end

	local var_65_5 = false

	for iter_65_8, iter_65_9 in pairs(var_65_0) do
		var_65_5 = true

		break
	end

	if var_65_5 then
		if not var_0_17.isHook then
			debug.sethook(var_0_18, "lrc")
		end

		var_0_17.isHook = true
	else
		if var_0_17.isHook then
			debug.sethook()
		end

		var_0_17.isHook = false
	end
end

local function var_0_32(arg_66_0)
	return var_0_17.breakInfos[arg_66_0]
end

local var_0_33 = "192.168.1.102"
local var_0_34 = 7003

local function var_0_35(arg_67_0, arg_67_1, arg_67_2)
	local var_67_0 = {
		event = arg_67_1,
		data = arg_67_2
	}
	local var_67_1 = var_0_16.encode(var_67_0)

	arg_67_0:send(var_67_1 .. "__debugger_k0204__")
end

function debugger_conditionStr(arg_68_0, arg_68_1, arg_68_2)
	local function var_68_0()
		local var_69_0 = {}
		local var_69_1 = arg_68_1[1].locals
		local var_69_2 = arg_68_1[1].ups

		if var_69_2 then
			for iter_69_0, iter_69_1 in pairs(var_69_2) do
				var_69_0[iter_69_0] = iter_69_1
			end
		end

		if var_69_1 then
			for iter_69_2, iter_69_3 in pairs(var_69_1) do
				var_69_0[iter_69_2] = iter_69_3
			end
		end

		setmetatable(var_69_0, {
			__index = _G
		})

		local var_69_3 = var_0_9("return " .. arg_68_0)

		var_0_5(var_69_3, var_69_0)

		return var_69_3()
	end

	local var_68_1, var_68_2 = xpcall(var_68_0, function(arg_70_0)
		print(arg_70_0)
	end)

	if var_68_1 and var_68_2 then
		arg_68_2()
	end
end

function var_0_3(arg_71_0, arg_71_1)
	local function var_71_0()
		local var_72_0 = arg_71_0.luastr

		if arg_71_1 then
			local var_72_1 = {
				_G = _G
			}
			local var_72_2 = arg_71_0.frameId + 1
			local var_72_3 = var_0_17.currentDebuggerData.funcs[var_72_2]
			local var_72_4 = var_0_17.currentDebuggerData.vars[var_72_2]
			local var_72_5 = var_72_4.locals
			local var_72_6 = var_72_4.ups

			for iter_72_0, iter_72_1 in pairs(var_72_6) do
				var_72_1[iter_72_0] = iter_72_1
			end

			for iter_72_2, iter_72_3 in pairs(var_72_5) do
				var_72_1[iter_72_2] = iter_72_3
			end

			setmetatable(var_72_1, {
				__index = _G
			})

			local var_72_7 = var_0_9(var_72_0)

			var_0_5(var_72_7, var_72_1)
			var_72_7()
		else
			var_0_9(var_72_0)()
		end
	end

	local var_71_1, var_71_2 = xpcall(var_71_0, function(arg_73_0)
		print(arg_73_0)
	end)

	if var_71_1 then
		var_0_35(var_0_14, var_0_17.event.C2S_LoadLuaScript, {
			msg = "执行代码成功"
		})

		if arg_71_1 then
			var_0_35(var_0_14, var_0_17.event.C2S_HITBreakPoint, var_0_17.currentDebuggerData.stack)
		end
	else
		var_0_35(var_0_14, var_0_17.event.C2S_LoadLuaScript, {
			msg = "加载代码失败"
		})
	end
end

local function var_0_36(arg_74_0)
	arg_74_0 = string.lower(arg_74_0)

	if var_0_17.pathCachePaths[arg_74_0] then
		var_0_17.currentLineFile = var_0_17.pathCachePaths[arg_74_0]

		return var_0_17.pathCachePaths[arg_74_0]
	end

	local var_74_0, var_74_1, var_74_2 = var_0_22(arg_74_0)

	var_0_17.currentLineFile = var_74_0
	var_0_17.pathCachePaths[arg_74_0] = var_74_2

	return var_74_2
end

local function var_0_37(arg_75_0, arg_75_1)
	local var_75_0 = var_0_8.getUserDataInfo(arg_75_1)
	local var_75_1 = {}

	if tolua and tolua.getpeer then
		local var_75_2 = tolua.getpeer(arg_75_1)

		if var_75_2 then
			for iter_75_0, iter_75_1 in pairs(var_75_2) do
				local var_75_3 = var_0_26(iter_75_0, iter_75_1)

				table.insert(var_75_1, var_75_3)
			end
		end
	end

	for iter_75_2 = 1, var_75_0.Count do
		local var_75_4 = var_75_0[iter_75_2 - 1]
		local var_75_5 = {
			csharp = true,
			name = var_75_4.name,
			valueType = var_75_4.valueType,
			valueStr = var_0_6.encode(var_75_4.valueStr),
			isValue = var_75_4.isValue
		}

		table.insert(var_75_1, var_75_5)
	end

	return var_75_1
end

local function var_0_38(arg_76_0, arg_76_1)
	local var_76_0
	local var_76_1, var_76_2 = xpcall(function()
		local var_77_0 = var_0_9("return " .. arg_76_1)

		var_0_5(var_77_0, arg_76_0)

		var_76_0 = var_77_0()
	end, function(arg_78_0)
		print(arg_78_0, "====>")

		var_76_0 = nil
	end)

	return var_76_0
end

local function var_0_39(arg_79_0, arg_79_1, arg_79_2)
	local var_79_0 = ""

	for iter_79_0 = arg_79_2, #arg_79_1 do
		local var_79_1 = arg_79_1[iter_79_0]

		if var_79_1 == "[metatable]" then
			-- block empty
		elseif iter_79_0 == arg_79_2 then
			if string.find(var_79_1, "%.") then
				if var_79_0 == "" then
					iter_79_0 = arg_79_2 + 1
					arg_79_0 = arg_79_0[var_79_1]
				end

				if iter_79_0 >= #arg_79_1 then
					return arg_79_2, arg_79_0
				end

				return var_0_39(arg_79_0, arg_79_1, iter_79_0)
			else
				var_79_0 = var_79_1
			end
		elseif string.find(var_79_1, "%[") then
			var_79_0 = var_79_0 .. var_79_1
		elseif type(var_79_1) == "string" then
			var_79_0 = var_79_0 .. "[\"" .. var_79_1 .. "\"]"
		else
			var_79_0 = var_79_0 .. "[" .. var_79_1 .. "]"
		end
	end

	local var_79_2 = var_0_38(arg_79_0, var_79_0)

	return #arg_79_1, var_79_2
end

local function var_0_40(arg_80_0, arg_80_1, arg_80_2)
	local var_80_0 = arg_80_2[arg_80_1]
	local var_80_1 = var_0_8.getCSharpValue(arg_80_0, var_80_0)

	if var_80_1 then
		if arg_80_1 == #arg_80_2 then
			return #arg_80_2, var_80_1
		else
			local var_80_2, var_80_3 = var_0_40(var_80_1, arg_80_1 + 1, arg_80_2)

			if not var_80_3 then
				local var_80_4 = {}

				for iter_80_0 = var_80_2, #arg_80_2 do
					table.insert(var_80_4, arg_80_2[iter_80_0])
				end

				local var_80_5, var_80_6 = debugger_searchVarByKeys(arg_80_0, searckKeys, 1)

				return var_80_5, var_80_6
			else
				return var_80_2, var_80_3
			end
		end
	else
		return arg_80_1, var_80_1
	end
end

local function var_0_41(arg_81_0, arg_81_1, arg_81_2)
	local var_81_0, var_81_1 = var_0_39(arg_81_0, arg_81_2, 1)

	if not var_0_8 then
		return var_81_0, var_81_1
	end

	if var_81_1 then
		if var_81_0 == #arg_81_1 then
			return var_81_0, var_81_1
		else
			local var_81_2 = ""
			local var_81_3 = #arg_81_1
			local var_81_4 = var_81_0 + 1
			local var_81_5, var_81_6 = var_0_40(var_81_1, var_81_4, arg_81_1)

			return var_81_5, var_81_6
		end
	else
		local var_81_7 = {}

		for iter_81_0 = 1, #arg_81_2 - 1 do
			table.insert(var_81_7, arg_81_1[iter_81_0])
		end

		if #var_81_7 == 0 then
			return #arg_81_1, nil
		end

		return var_0_41(arg_81_0, arg_81_1, var_81_7)
	end
end

local function var_0_42(arg_82_0, arg_82_1, arg_82_2, arg_82_3, arg_82_4, arg_82_5, arg_82_6)
	for iter_82_0, iter_82_1 in ipairs(arg_82_6) do
		if arg_82_1 == iter_82_1 then
			return arg_82_2
		end
	end

	table.insert(arg_82_6, arg_82_1)

	for iter_82_2, iter_82_3 in pairs(arg_82_1) do
		local var_82_0

		if type(iter_82_2) == "string" then
			xpcall(function()
				var_82_0 = arg_82_0[iter_82_2]
			end, function(arg_84_0)
				var_82_0 = nil
			end)

			if var_82_0 == nil then
				xpcall(function()
					if string.find(iter_82_2, "__") then
						var_82_0 = iter_82_3
					end
				end, function(arg_86_0)
					var_82_0 = nil
				end)
			end
		end

		if var_82_0 then
			local var_82_1 = var_0_26(iter_82_2, var_82_0)

			table.insert(arg_82_2, var_82_1)

			if #arg_82_2 > 10 then
				var_0_35(arg_82_3, var_0_17.event.C2S_ReqVar, {
					isComplete = 0,
					variablesReference = arg_82_4,
					debugSpeedIndex = arg_82_5,
					vars = arg_82_2
				})

				arg_82_2 = {}
			end
		end
	end

	local var_82_2 = getmetatable(arg_82_1)

	if var_82_2 then
		return var_0_42(arg_82_0, var_82_2, arg_82_2, arg_82_3, arg_82_4, arg_82_5, arg_82_6)
	else
		return arg_82_2
	end
end

local function var_0_43(arg_87_0, arg_87_1, arg_87_2, arg_87_3, arg_87_4, arg_87_5)
	if arg_87_5 == "userdata" then
		if tolua and tolua.getpeer then
			arg_87_0 = tolua.getpeer(arg_87_0)
		else
			return arg_87_1
		end
	end

	if arg_87_0 == nil then
		return arg_87_1
	end

	for iter_87_0, iter_87_1 in pairs(arg_87_0) do
		local var_87_0 = var_0_26(iter_87_0, iter_87_1)

		table.insert(arg_87_1, var_87_0)

		if #arg_87_1 > 10 then
			var_0_35(arg_87_2, var_0_17.event.C2S_ReqVar, {
				isComplete = 0,
				variablesReference = arg_87_3,
				debugSpeedIndex = arg_87_4,
				vars = arg_87_1
			})

			arg_87_1 = {}
		end
	end

	return arg_87_1
end

local function var_0_44(arg_88_0, arg_88_1, arg_88_2, arg_88_3)
	local var_88_0 = {}
	local var_88_1 = {}
	local var_88_2 = type(arg_88_0)
	local var_88_3 = {}
	local var_88_4

	if var_88_2 == "userdata" then
		if tolua and tolua.getpeer then
			var_88_4 = getmetatable(arg_88_0)
			var_88_0 = var_0_43(arg_88_0, var_88_0, arg_88_1, arg_88_2, arg_88_3, var_88_2)
		end

		if var_0_8 then
			local var_88_5 = var_0_37(arg_88_1, arg_88_0, arg_88_2, arg_88_3)

			for iter_88_0, iter_88_1 in ipairs(var_88_5) do
				if iter_88_1.valueType == "System.Byte[]" and arg_88_0[iter_88_1.name] and type(arg_88_0[iter_88_1.name]) == "string" then
					local var_88_6 = {
						valueType = "string",
						name = iter_88_1.name,
						valueStr = var_0_6.encode(arg_88_0[iter_88_1.name])
					}

					table.insert(var_88_0, var_88_6)
				else
					table.insert(var_88_0, iter_88_1)
				end

				if #var_88_0 > 10 then
					var_0_35(arg_88_1, var_0_17.event.C2S_ReqVar, {
						isComplete = 0,
						variablesReference = arg_88_2,
						debugSpeedIndex = arg_88_3,
						vars = var_88_0
					})

					var_88_0 = {}
				end
			end

			var_88_4 = getmetatable(arg_88_0)
		end
	else
		var_88_4 = getmetatable(arg_88_0)
		var_88_0 = var_0_43(arg_88_0, var_88_0, arg_88_1, arg_88_2, arg_88_3, var_88_2)
	end

	if var_88_4 then
		var_88_0 = var_0_42(arg_88_0, var_88_4, var_88_0, arg_88_1, arg_88_2, arg_88_3, {})
	end

	var_0_35(arg_88_1, var_0_17.event.C2S_ReqVar, {
		isComplete = 1,
		variablesReference = arg_88_2,
		debugSpeedIndex = arg_88_3,
		vars = var_88_0
	})
end

local function var_0_45(arg_89_0, arg_89_1)
	local var_89_0 = arg_89_0.variablesReference
	local var_89_1 = arg_89_0.debugSpeedIndex
	local var_89_2 = {}

	local function var_89_3()
		local var_90_0 = arg_89_0.frameId
		local var_90_1 = arg_89_0.type
		local var_90_2 = arg_89_0.keys
		local var_90_3

		if var_90_1 == 1 then
			var_90_3 = var_0_17.currentDebuggerData.vars[var_90_0 + 1]
			var_90_3 = var_90_3.locals
		elseif var_90_1 == 2 then
			var_90_3 = var_0_17.currentDebuggerData.vars[var_90_0 + 1]
			var_90_3 = var_90_3.ups
		elseif var_90_1 == 3 then
			var_90_3 = _G
		end

		if #var_90_2 == 0 then
			var_0_44(var_90_3, arg_89_1, var_89_0, var_89_1)

			return
		end

		local var_90_4, var_90_5 = var_0_41(var_90_3, var_90_2, var_90_2)

		if var_90_5 then
			local var_90_6 = type(var_90_5)

			if var_90_6 == "table" or var_90_6 == "userdata" then
				var_0_44(var_90_5, arg_89_1, var_89_0, var_89_1)
			else
				if var_90_6 == "function" then
					var_90_5 = tostring(var_90_5)
				end

				var_0_35(arg_89_1, var_0_17.event.C2S_ReqVar, {
					isComplete = 1,
					variablesReference = var_89_0,
					debugSpeedIndex = var_89_1,
					vars = var_0_6.encode(var_90_5),
					varType = var_90_6
				})
			end
		else
			var_0_35(arg_89_1, var_0_17.event.C2S_ReqVar, {
				isComplete = 1,
				varType = "nil",
				variablesReference = var_89_0,
				debugSpeedIndex = var_89_1,
				vars = {}
			})
		end
	end

	xpcall(var_89_3, function(arg_91_0)
		var_0_35(arg_89_1, var_0_17.event.C2S_ReqVar, {
			isComplete = 1,
			variablesReference = var_89_0,
			debugSpeedIndex = var_89_1,
			vars = {
				{
					isValue = false,
					name = "error",
					valueType = "string",
					valueStr = var_0_6.encode("无法获取属性值:" .. arg_91_0 .. "->" .. debug.traceback("", 2))
				}
			}
		})
	end)
end

local function var_0_46()
	var_0_17.Run = false
	var_0_17.StepIn = false
	var_0_17.StepNext = false
	var_0_17.StepOut = false
	var_0_17.StepNextLevel = 0
end

local function var_0_47(arg_93_0)
	arg_93_0 = var_0_14

	local var_93_0
	local var_93_1 = {}
	local var_93_2

	while true do
		local var_93_3, var_93_4 = arg_93_0:receive()

		if var_93_4 == "closed" then
			debug.sethook()
			coroutine.yield()
		end

		if var_93_3 then
			local var_93_5 = var_0_16.decode(var_93_3)
			local var_93_6 = var_93_5.event
			local var_93_7 = var_93_5.data

			if var_93_6 == var_0_17.event.S2C_DebugClose then
				debug.sethook()
				coroutine.yield()
			elseif var_93_6 == var_0_17.event.S2C_SetBreakPoints then
				local function var_93_8()
					var_0_29(var_93_7)
				end

				xpcall(var_93_8, function(arg_95_0)
					print(arg_95_0)
				end)
			elseif var_93_6 == var_0_17.event.S2C_RUN then
				var_0_17.runTimeType = var_93_7.runTimeType
				var_0_17.isProntToConsole = var_93_7.isProntToConsole
				var_0_17.isFoxGloryProject = var_93_7.isFoxGloryProject

				var_0_46()

				var_0_17.Run = true

				local var_93_9 = coroutine.yield()

				var_0_17.currentDebuggerData = var_93_9

				var_0_35(arg_93_0, var_93_9.event, {
					stack = var_93_9.stack
				})
			elseif var_93_6 == var_0_17.event.S2C_ReqVar then
				var_0_45(var_93_7, arg_93_0)
			elseif var_93_6 == var_0_17.event.S2C_NextRequest then
				var_0_46()

				var_0_17.StepNext = true
				var_0_17.StepNextLevel = 0

				local var_93_10 = coroutine.yield()

				var_0_17.currentDebuggerData = var_93_10

				var_0_35(arg_93_0, var_93_10.event, {
					stack = var_93_10.stack
				})
			elseif var_93_6 == var_0_17.event.S2C_StepInRequest then
				var_0_46()

				var_0_17.StepIn = true

				local var_93_11 = coroutine.yield()

				var_0_17.currentDebuggerData = var_93_11

				var_0_35(arg_93_0, var_93_11.event, {
					stack = var_93_11.stack,
					eventType = var_93_11.eventType
				})
			elseif var_93_6 == var_0_17.event.S2C_StepOutRequest then
				var_0_46()

				var_0_17.StepOut = true

				local var_93_12 = coroutine.yield()

				var_0_17.currentDebuggerData = var_93_12

				var_0_35(arg_93_0, var_93_12.event, {
					stack = var_93_12.stack,
					eventType = var_93_12.eventType
				})
			elseif var_93_6 == var_0_17.event.S2C_LoadLuaScript then
				var_0_3(var_93_7, true)
			end
		end
	end
end

local var_0_48 = coroutine.create(var_0_47)

function var_0_18(arg_96_0, arg_96_1)
	if not var_0_17.isHook then
		return
	end

	if var_0_17.Run then
		if arg_96_0 == "line" then
			local var_96_0 = false

			for iter_96_0, iter_96_1 in pairs(var_0_17.breakInfos) do
				for iter_96_2, iter_96_3 in pairs(iter_96_1) do
					if iter_96_3.lines and iter_96_3.lines[arg_96_1] then
						var_96_0 = true

						break
					end
				end

				if var_96_0 then
					break
				end
			end

			if not var_96_0 then
				return
			end
		else
			var_0_17.currentFileName = nil
			var_0_17.currentTempFunc = nil

			return
		end
	end

	if var_0_17.StepOut then
		if arg_96_0 == "line" or arg_96_0 == "call" then
			return
		end

		local var_96_1 = var_0_10(2, "f").func

		if var_0_17.currentDebuggerData.funcsLength == 1 then
			var_0_46()

			var_0_17.Run = true
		elseif var_0_17.currentDebuggerData.funcs[2] == var_96_1 then
			local var_96_2 = var_0_28(3, var_0_17.event.C2S_StepInResponse)

			var_0_19(var_0_48, var_96_2)
		end

		return
	end

	local var_96_3

	if arg_96_0 == "call" then
		if not var_0_17.Run then
			var_0_17.StepNextLevel = var_0_17.StepNextLevel + 1
		end

		local var_96_4 = var_0_10(2, "S").source

		if var_96_4:find(var_0_17.DebugLuaFie) or var_96_4 == "=[C]" then
			return
		end

		local var_96_5 = var_0_36(var_96_4)

		var_0_17.currentFileName = var_96_5
	elseif arg_96_0 == "return" or arg_96_0 == "tail return" then
		if not var_0_17.Run then
			var_0_17.StepNextLevel = var_0_17.StepNextLevel - 1
		end

		var_0_17.currentFileName = nil
	elseif arg_96_0 == "line" then
		local var_96_6 = false
		local var_96_7

		if not var_0_17.currentFileName then
			var_96_7 = var_0_10(2, "S")

			local var_96_8 = var_96_7.source

			if var_96_8 == "=[C]" or var_96_8:find(var_0_17.DebugLuaFie) then
				return
			end

			local var_96_9 = var_0_36(var_96_8)

			var_0_17.currentFileName = var_96_9
		end

		local var_96_10 = var_0_17.currentFileName
		local var_96_11 = var_0_17.breakInfos[var_96_10]
		local var_96_12

		if var_96_11 then
			local var_96_13 = false

			for iter_96_4, iter_96_5 in pairs(var_96_11) do
				local var_96_14 = iter_96_5.lines

				if var_96_14 and var_96_14[arg_96_1] then
					var_96_13 = true

					break
				end
			end

			if var_96_13 then
				if not var_96_7 then
					local var_96_15 = var_0_10(2)
				end

				local var_96_16 = var_0_31(var_0_17.currentLineFile)
				local var_96_17 = {}
				local var_96_18

				for iter_96_6, iter_96_7 in pairs(var_96_11) do
					local var_96_19 = iter_96_7.lines
					local var_96_20 = iter_96_7.pathNames

					var_96_18 = iter_96_7.hitCounts

					if var_96_19 and var_96_19[arg_96_1] then
						var_96_12 = var_96_19[arg_96_1]
						var_96_17[iter_96_6] = 0

						local var_96_21 = #var_96_16
						local var_96_22 = #var_96_20

						repeat
							if var_96_20[var_96_22] ~= var_96_16[var_96_21] then
								break
							else
								var_96_17[iter_96_6] = var_96_17[iter_96_6] + 1
							end

							var_96_22 = var_96_22 - 1
							var_96_21 = var_96_21 - 1
						until var_96_22 <= 0 or var_96_21 <= 0
					else
						var_96_12 = nil
					end
				end

				if var_96_12 then
					local var_96_23 = ""
					local var_96_24 = 0

					for iter_96_8, iter_96_9 in pairs(var_96_17) do
						if var_96_24 < iter_96_9 then
							var_96_24 = iter_96_9
							var_96_23 = iter_96_8
						end
					end

					local var_96_25 = #var_96_16

					if (var_96_25 == 1 or var_96_25 > 1 and var_96_24 > 1) and var_96_23 ~= "" then
						local var_96_26 = var_96_12.hitCondition
						local var_96_27 = var_96_18[var_96_12.line] + 1

						var_96_18[var_96_12.line] = var_96_27

						if var_96_26 <= var_96_27 then
							var_96_6 = true
						end
					end
				end
			end
		end

		if var_0_17.StepIn then
			local var_96_28 = var_0_28(3, var_0_17.event.C2S_NextResponse)

			if var_96_28 then
				var_0_17.currentTempFunc = var_96_28.funcs[1]

				var_0_19(var_0_48, var_96_28)

				return
			end
		end

		if var_0_17.StepNext and var_0_17.StepNextLevel <= 0 then
			local var_96_29 = var_0_28(3, var_0_17.event.C2S_NextResponse)

			if var_96_29 then
				var_0_17.currentTempFunc = var_96_29.funcs[1]

				var_0_19(var_0_48, var_96_29)

				return
			end
		end

		if var_96_6 then
			local var_96_30 = var_0_28(3, var_0_17.event.C2S_HITBreakPoint)

			if var_96_12 and var_96_12.condition then
				debugger_conditionStr(var_96_12.condition, var_96_30.vars, function()
					var_0_19(var_0_48, var_96_30)
				end)
			else
				var_0_19(var_0_48, var_96_30)
			end
		end
	end
end

local function var_0_49()
	local var_98_0 = var_0_28(4, var_0_17.event.C2S_HITBreakPoint)

	var_0_19(var_0_48, var_98_0)
end

local function var_0_50()
	local var_99_0, var_99_1, var_99_2 = var_0_22(var_0_10(1).source)

	var_0_17.DebugLuaFie = var_99_2

	local var_99_3 = var_0_11()

	print(var_0_33)
	print(var_0_34)

	local var_99_4 = var_99_3.connect(var_0_33, var_0_34)

	var_0_14 = var_99_4

	if var_99_4 then
		var_0_15 = var_0_11().connect(var_0_33, var_0_34)

		if var_0_15 then
			var_0_15:settimeout(0)
			var_0_35(var_0_15, var_0_17.event.C2S_SetSocketName, {
				name = "breakPointSocket"
			})
			var_0_35(var_99_4, var_0_17.event.C2S_SetSocketName, {
				name = "mainSocket",
				version = var_0_17.version
			})
			xpcall(function()
				debug.sethook(var_0_18, "lrc")
			end, function(arg_101_0)
				print("error:", arg_101_0)
			end)

			if jit and var_0_17.debugLuaType ~= "jit" then
				print("error======================================================")

				local var_99_5 = "当前luajit版本为: " .. jit.version .. " 请使用LuaDebugjit 进行调试!"

				print(var_99_5)
			end

			var_0_19(var_0_48, var_99_4)
		end
	end
end

function StartDebug(arg_102_0, arg_102_1)
	if not arg_102_0 then
		print("error host nil")
	end

	if not arg_102_1 then
		print("error prot nil")
	end

	if type(arg_102_0) ~= "string" then
		print("error host not string")
	end

	if type(arg_102_1) ~= "number" then
		print("error host not number")
	end

	var_0_33 = arg_102_0
	var_0_34 = arg_102_1

	xpcall(var_0_50, function(arg_103_0)
		print(arg_103_0)
	end)

	return var_0_30, var_0_49
end

local var_0_51 = string

var_0_6.__code = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"a",
	"b",
	"c",
	"d",
	"e",
	"f",
	"g",
	"h",
	"i",
	"j",
	"k",
	"l",
	"m",
	"n",
	"o",
	"p",
	"q",
	"r",
	"s",
	"t",
	"u",
	"v",
	"w",
	"x",
	"y",
	"z",
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"+",
	"/"
}
var_0_6.__decode = {}

for iter_0_0, iter_0_1 in pairs(var_0_6.__code) do
	var_0_6.__decode[var_0_51.byte(iter_0_1, 1)] = iter_0_0 - 1
end

function var_0_6.encode(arg_104_0)
	local var_104_0 = var_0_51.len(arg_104_0)
	local var_104_1 = var_104_0 % 3
	local var_104_2 = var_104_0 - var_104_1
	local var_104_3 = {}
	local var_104_4 = 1

	for iter_104_0 = 1, var_104_2, 3 do
		local var_104_5 = var_0_51.byte(arg_104_0, iter_104_0)
		local var_104_6 = var_0_51.byte(arg_104_0, iter_104_0 + 1)
		local var_104_7 = var_0_51.byte(arg_104_0, iter_104_0 + 2)
		local var_104_8 = var_104_5 * 65536 + var_104_6 * 256 + var_104_7

		for iter_104_1 = 1, 4 do
			local var_104_9 = math.floor(var_104_8 / 2^((4 - iter_104_1) * 6)) % 64 + 1

			var_104_3[var_104_4] = var_0_6.__code[var_104_9]
			var_104_4 = var_104_4 + 1
		end
	end

	if var_104_1 == 1 then
		var_0_6.__left1(var_104_3, var_104_4, arg_104_0, var_104_2)
	elseif var_104_1 == 2 then
		var_0_6.__left2(var_104_3, var_104_4, arg_104_0, var_104_2)
	end

	return table.concat(var_104_3)
end

function var_0_6.__left2(arg_105_0, arg_105_1, arg_105_2, arg_105_3)
	local var_105_0 = var_0_51.byte(arg_105_2, arg_105_3 + 1) * 1024 + var_0_51.byte(arg_105_2, arg_105_3 + 2) * 4
	local var_105_1 = math.floor(var_105_0 / 4096) % 64 + 1

	arg_105_0[arg_105_1] = var_0_6.__code[var_105_1]

	local var_105_2 = math.floor(var_105_0 / 64) % 64 + 1

	arg_105_0[arg_105_1 + 1] = var_0_6.__code[var_105_2]

	local var_105_3 = var_105_0 % 64 + 1

	arg_105_0[arg_105_1 + 2] = var_0_6.__code[var_105_3]
	arg_105_0[arg_105_1 + 3] = "="
end

function var_0_6.__left1(arg_106_0, arg_106_1, arg_106_2, arg_106_3)
	local var_106_0 = var_0_51.byte(arg_106_2, arg_106_3 + 1) * 16
	local var_106_1 = math.floor(var_106_0 / 64) % 64 + 1

	arg_106_0[arg_106_1] = var_0_6.__code[var_106_1]

	local var_106_2 = var_106_0 % 64 + 1

	arg_106_0[arg_106_1 + 1] = var_0_6.__code[var_106_2]
	arg_106_0[arg_106_1 + 2] = "="
	arg_106_0[arg_106_1 + 3] = "="
end

function var_0_6.decode(arg_107_0)
	local var_107_0 = var_0_51.len(arg_107_0)
	local var_107_1 = 0

	if var_0_51.sub(arg_107_0, var_107_0 - 1) == "==" then
		var_107_1 = 2
		var_107_0 = var_107_0 - 4
	elseif var_0_51.sub(arg_107_0, var_107_0) == "=" then
		var_107_1 = 1
		var_107_0 = var_107_0 - 4
	end

	local var_107_2 = {}
	local var_107_3 = 1
	local var_107_4 = var_0_6.__decode

	for iter_107_0 = 1, var_107_0, 4 do
		local var_107_5 = var_107_4[var_0_51.byte(arg_107_0, iter_107_0)]
		local var_107_6 = var_107_4[var_0_51.byte(arg_107_0, iter_107_0 + 1)]
		local var_107_7 = var_107_4[var_0_51.byte(arg_107_0, iter_107_0 + 2)]
		local var_107_8 = var_107_4[var_0_51.byte(arg_107_0, iter_107_0 + 3)]
		local var_107_9 = var_107_5 * 262144 + var_107_6 * 4096 + var_107_7 * 64 + var_107_8
		local var_107_10 = var_0_51.char(var_107_9 % 256)
		local var_107_11 = math.floor(var_107_9 / 256)
		local var_107_12 = var_0_51.char(var_107_11 % 256)
		local var_107_13 = math.floor(var_107_11 / 256)

		var_107_2[var_107_3] = var_0_51.char(var_107_13 % 256)
		var_107_2[var_107_3 + 1] = var_107_12
		var_107_2[var_107_3 + 2] = var_107_10
		var_107_3 = var_107_3 + 3
	end

	if var_107_1 == 1 then
		var_0_6.__decodeLeft1(var_107_2, var_107_3, arg_107_0, var_107_0)
	elseif var_107_1 == 2 then
		var_0_6.__decodeLeft2(var_107_2, var_107_3, arg_107_0, var_107_0)
	end

	return table.concat(var_107_2)
end

function var_0_6.__decodeLeft1(arg_108_0, arg_108_1, arg_108_2, arg_108_3)
	local var_108_0 = var_0_6.__decode
	local var_108_1 = var_108_0[var_0_51.byte(arg_108_2, arg_108_3 + 1)]
	local var_108_2 = var_108_0[var_0_51.byte(arg_108_2, arg_108_3 + 2)]
	local var_108_3 = var_108_0[var_0_51.byte(arg_108_2, arg_108_3 + 3)]
	local var_108_4 = var_108_1 * 4096 + var_108_2 * 64 + var_108_3
	local var_108_5 = math.floor(var_108_4 / 1024) % 256
	local var_108_6 = math.floor(var_108_4 / 4) % 256

	arg_108_0[arg_108_1] = var_0_51.char(var_108_5)
	arg_108_0[arg_108_1 + 1] = var_0_51.char(var_108_6)
end

function var_0_6.__decodeLeft2(arg_109_0, arg_109_1, arg_109_2, arg_109_3)
	local var_109_0 = var_0_6.__decode
	local var_109_1 = var_109_0[var_0_51.byte(arg_109_2, arg_109_3 + 1)]
	local var_109_2 = var_109_0[var_0_51.byte(arg_109_2, arg_109_3 + 2)]
	local var_109_3 = var_109_1 * 64 + var_109_2
	local var_109_4 = math.floor(var_109_3 / 16)

	arg_109_0[arg_109_1] = var_0_51.char(var_109_4)
end

return StartDebug
