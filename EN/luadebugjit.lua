local var_0_0 = debug.sethook
local var_0_1
local var_0_2
local var_0_3 = require
local var_0_4
local var_0_5

if loadstring then
	var_0_5 = loadstring
else
	var_0_5 = load
end

local var_0_6 = {}
local var_0_7

if LuaDebugTool then
	var_0_7 = LuaDebugTool
elseif CS and CS.LuaDebugTool then
	var_0_7 = CS.LuaDebugTool
end

local var_0_8 = var_0_7
local var_0_9 = var_0_5
local var_0_10 = debug.getinfo

local function var_0_11()
	local var_1_0 = _G
	local var_1_1 = require("string")
	local var_1_2 = require("math")
	local var_1_3 = require("socket.core")
	local var_1_4 = var_1_3

	function var_1_4.connect4(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		return var_1_3.connect(arg_2_0, arg_2_1, arg_2_2, arg_2_3, "inet")
	end

	function var_1_4.connect6(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		return var_1_3.connect(arg_3_0, arg_3_1, arg_3_2, arg_3_3, "inet6")
	end

	if not var_1_4.connect then
		function var_1_4.connect(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
			local var_4_0, var_4_1 = var_1_3.tcp()

			if not var_4_0 then
				return nil, var_4_1
			end

			if arg_4_2 then
				local var_4_2, var_4_3 = var_4_0:bind(arg_4_2, arg_4_3, -1)

				if not var_4_2 then
					return nil, var_4_3
				end
			end

			local var_4_4, var_4_5 = var_4_0:connect(arg_4_0, arg_4_1)

			if not var_4_4 then
				return nil, var_4_5
			end

			return var_4_0
		end
	end

	function var_1_4.bind(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == "*" then
			arg_5_0 = "0.0.0.0"
		end

		local var_5_0, var_5_1 = var_1_3.dns.getaddrinfo(arg_5_0)

		if not var_5_0 then
			return nil, var_5_1
		end

		local var_5_2
		local var_5_3
		local var_5_4 = "no info on address"

		for iter_5_0, iter_5_1 in var_1_0.ipairs(var_5_0) do
			if iter_5_1.family == "inet" then
				var_5_2, var_5_4 = var_1_3.tcp4()
			else
				var_5_2, var_5_4 = var_1_3.tcp6()
			end

			if not var_5_2 then
				return nil, var_5_4
			end

			var_5_2:setoption("reuseaddr", true)

			local var_5_5, var_5_6 = var_5_2:bind(iter_5_1.addr, arg_5_1)

			var_5_4 = var_5_6

			if not var_5_5 then
				var_5_2:close()
			else
				local var_5_7, var_5_8 = var_5_2:listen(arg_5_2)

				var_5_4 = var_5_8

				if not var_5_7 then
					var_5_2:close()
				else
					return var_5_2
				end
			end
		end

		return nil, var_5_4
	end

	var_1_4.try = var_1_4.newtry()

	function var_1_4.choose(arg_6_0)
		return function(arg_7_0, arg_7_1, arg_7_2)
			if var_1_0.type(arg_7_0) ~= "string" then
				arg_7_0, arg_7_1, arg_7_2 = "default", arg_7_0, arg_7_1
			end

			local var_7_0 = arg_6_0[arg_7_0 or "nil"]

			if not var_7_0 then
				var_1_0.error("unknown key (" .. var_1_0.tostring(arg_7_0) .. ")", 3)
			else
				return var_7_0(arg_7_1, arg_7_2)
			end
		end
	end

	local var_1_5 = {}
	local var_1_6 = {}

	var_1_4.sourcet = var_1_5
	var_1_4.sinkt = var_1_6
	var_1_4.BLOCKSIZE = 2048
	var_1_6["close-when-done"] = function(arg_8_0)
		return var_1_0.setmetatable({
			getfd = function()
				return arg_8_0:getfd()
			end,
			dirty = function()
				return arg_8_0:dirty()
			end
		}, {
			__call = function(arg_11_0, arg_11_1, arg_11_2)
				if not arg_11_1 then
					arg_8_0:close()

					return 1
				else
					return arg_8_0:send(arg_11_1)
				end
			end
		})
	end
	var_1_6["keep-open"] = function(arg_12_0)
		return var_1_0.setmetatable({
			getfd = function()
				return arg_12_0:getfd()
			end,
			dirty = function()
				return arg_12_0:dirty()
			end
		}, {
			__call = function(arg_15_0, arg_15_1, arg_15_2)
				if arg_15_1 then
					return arg_12_0:send(arg_15_1)
				else
					return 1
				end
			end
		})
	end
	var_1_6.default = var_1_6["keep-open"]
	var_1_4.sink = var_1_4.choose(var_1_6)
	var_1_5["by-length"] = function(arg_16_0, arg_16_1)
		return var_1_0.setmetatable({
			getfd = function()
				return arg_16_0:getfd()
			end,
			dirty = function()
				return arg_16_0:dirty()
			end
		}, {
			__call = function()
				if arg_16_1 <= 0 then
					return nil
				end

				local var_19_0 = var_1_2.min(var_1_3.BLOCKSIZE, arg_16_1)
				local var_19_1, var_19_2 = arg_16_0:receive(var_19_0)

				if var_19_2 then
					return nil, var_19_2
				end

				arg_16_1 = arg_16_1 - var_1_1.len(var_19_1)

				return var_19_1
			end
		})
	end
	var_1_5["until-closed"] = function(arg_20_0)
		local var_20_0

		return var_1_0.setmetatable({
			getfd = function()
				return arg_20_0:getfd()
			end,
			dirty = function()
				return arg_20_0:dirty()
			end
		}, {
			__call = function()
				if var_20_0 then
					return nil
				end

				local var_23_0, var_23_1, var_23_2 = arg_20_0:receive(var_1_3.BLOCKSIZE)

				if not var_23_1 then
					return var_23_0
				elseif var_23_1 == "closed" then
					arg_20_0:close()

					var_20_0 = 1

					return var_23_2
				else
					return nil, var_23_1
				end
			end
		})
	end
	var_1_5.default = var_1_5["until-closed"]
	var_1_4.source = var_1_4.choose(var_1_5)

	return var_1_4
end

local function var_0_12()
	local var_24_0 = require("math")
	local var_24_1 = require("string")
	local var_24_2 = require("table")
	local var_24_3
	local var_24_4 = {}
	local var_24_5 = {}

	var_24_4.EMPTY_ARRAY = {}
	var_24_4.EMPTY_OBJECT = {}

	local var_24_6
	local var_24_7
	local var_24_8
	local var_24_9
	local var_24_10
	local var_24_11
	local var_24_12
	local var_24_13
	local var_24_14
	local var_24_15

	function var_24_4.encode(arg_25_0)
		if arg_25_0 == nil then
			return "null"
		end

		local var_25_0 = type(arg_25_0)

		if var_25_0 == "string" then
			return "\"" .. var_24_5.encodeString(arg_25_0) .. "\""
		end

		if var_25_0 == "number" or var_25_0 == "boolean" then
			return tostring(arg_25_0)
		end

		if var_25_0 == "table" then
			local var_25_1 = {}
			local var_25_2, var_25_3 = var_24_14(arg_25_0)

			if var_25_2 then
				for iter_25_0 = 1, var_25_3 do
					var_24_2.insert(var_25_1, var_24_4.encode(arg_25_0[iter_25_0]))
				end
			else
				for iter_25_1, iter_25_2 in pairs(arg_25_0) do
					if var_24_15(iter_25_1) and var_24_15(iter_25_2) then
						var_24_2.insert(var_25_1, "\"" .. var_24_5.encodeString(iter_25_1) .. "\":" .. var_24_4.encode(iter_25_2))
					end
				end
			end

			if var_25_2 then
				return "[" .. var_24_2.concat(var_25_1, ",") .. "]"
			else
				return "{" .. var_24_2.concat(var_25_1, ",") .. "}"
			end
		end

		if var_25_0 == "function" and arg_25_0 == var_24_4.null then
			return "null"
		end

		assert(false, "encode attempt to encode unsupported type " .. var_25_0 .. ":" .. tostring(arg_25_0))
	end

	function var_24_4.decode(arg_26_0, arg_26_1)
		arg_26_1 = arg_26_1 and arg_26_1 or 1
		arg_26_1 = var_24_12(arg_26_0, arg_26_1)

		assert(arg_26_1 <= var_24_1.len(arg_26_0), "Unterminated JSON encoded object found at position in [" .. arg_26_0 .. "]")

		local var_26_0 = var_24_1.sub(arg_26_0, arg_26_1, arg_26_1)

		if var_26_0 == "{" then
			return var_24_10(arg_26_0, arg_26_1)
		end

		if var_26_0 == "[" then
			return var_24_6(arg_26_0, arg_26_1)
		end

		if var_24_1.find("+-0123456789.e", var_26_0, 1, true) then
			return var_24_9(arg_26_0, arg_26_1)
		end

		if var_26_0 == "\"" or var_26_0 == "'" then
			return var_24_11(arg_26_0, arg_26_1)
		end

		if var_24_1.sub(arg_26_0, arg_26_1, arg_26_1 + 1) == "/*" then
			return var_24_4.decode(arg_26_0, var_24_7(arg_26_0, arg_26_1))
		end

		return var_24_8(arg_26_0, arg_26_1)
	end

	function var_24_4.null()
		return var_24_4.null
	end

	function var_24_6(arg_28_0, arg_28_1)
		local var_28_0 = {}
		local var_28_1 = var_24_1.len(arg_28_0)

		assert(var_24_1.sub(arg_28_0, arg_28_1, arg_28_1) == "[", "decode_scanArray called but array does not start at position " .. arg_28_1 .. " in string:\n" .. arg_28_0)

		arg_28_1 = arg_28_1 + 1

		repeat
			arg_28_1 = var_24_12(arg_28_0, arg_28_1)

			assert(arg_28_1 <= var_28_1, "JSON String ended unexpectedly scanning array.")

			local var_28_2 = var_24_1.sub(arg_28_0, arg_28_1, arg_28_1)

			if var_28_2 == "]" then
				return var_28_0, arg_28_1 + 1
			end

			if var_28_2 == "," then
				arg_28_1 = var_24_12(arg_28_0, arg_28_1 + 1)
			end

			assert(arg_28_1 <= var_28_1, "JSON String ended unexpectedly scanning array.")

			var_24_3, arg_28_1 = var_24_4.decode(arg_28_0, arg_28_1)

			var_24_2.insert(var_28_0, var_24_3)
		until false
	end

	function var_24_7(arg_29_0, arg_29_1)
		assert(var_24_1.sub(arg_29_0, arg_29_1, arg_29_1 + 1) == "/*", "decode_scanComment called but comment does not start at position " .. arg_29_1)

		local var_29_0 = var_24_1.find(arg_29_0, "*/", arg_29_1 + 2)

		assert(var_29_0 ~= nil, "Unterminated comment in string at " .. arg_29_1)

		return var_29_0 + 2
	end

	function var_24_8(arg_30_0, arg_30_1)
		local var_30_0 = {
			["true"] = true,
			["false"] = false
		}
		local var_30_1 = {
			"true",
			"false",
			"null"
		}

		for iter_30_0, iter_30_1 in pairs(var_30_1) do
			if var_24_1.sub(arg_30_0, arg_30_1, arg_30_1 + var_24_1.len(iter_30_1) - 1) == iter_30_1 then
				return var_30_0[iter_30_1], arg_30_1 + var_24_1.len(iter_30_1)
			end
		end

		assert(nil, "Failed to scan constant from string " .. arg_30_0 .. " at starting position " .. arg_30_1)
	end

	function var_24_9(arg_31_0, arg_31_1)
		local var_31_0 = arg_31_1 + 1
		local var_31_1 = var_24_1.len(arg_31_0)
		local var_31_2 = "+-0123456789.e"

		while var_24_1.find(var_31_2, var_24_1.sub(arg_31_0, var_31_0, var_31_0), 1, true) and var_31_0 <= var_31_1 do
			var_31_0 = var_31_0 + 1
		end

		local var_31_3 = "return " .. var_24_1.sub(arg_31_0, arg_31_1, var_31_0 - 1)
		local var_31_4 = var_0_9(var_31_3)

		assert(var_31_4, "Failed to scan number [ " .. var_31_3 .. "] in JSON string at position " .. arg_31_1 .. " : " .. var_31_0)

		return var_31_4(), var_31_0
	end

	function var_24_10(arg_32_0, arg_32_1)
		local var_32_0 = {}
		local var_32_1 = var_24_1.len(arg_32_0)
		local var_32_2
		local var_32_3

		assert(var_24_1.sub(arg_32_0, arg_32_1, arg_32_1) == "{", "decode_scanObject called but object does not start at position " .. arg_32_1 .. " in string:\n" .. arg_32_0)

		arg_32_1 = arg_32_1 + 1

		repeat
			arg_32_1 = var_24_12(arg_32_0, arg_32_1)

			assert(arg_32_1 <= var_32_1, "JSON string ended unexpectedly while scanning object.")

			local var_32_4 = var_24_1.sub(arg_32_0, arg_32_1, arg_32_1)

			if var_32_4 == "}" then
				return var_32_0, arg_32_1 + 1
			end

			if var_32_4 == "," then
				arg_32_1 = var_24_12(arg_32_0, arg_32_1 + 1)
			end

			assert(arg_32_1 <= var_32_1, "JSON string ended unexpectedly scanning object.")

			local var_32_5

			var_32_5, arg_32_1 = var_24_4.decode(arg_32_0, arg_32_1)

			assert(arg_32_1 <= var_32_1, "JSON string ended unexpectedly searching for value of key " .. var_32_5)

			arg_32_1 = var_24_12(arg_32_0, arg_32_1)

			assert(arg_32_1 <= var_32_1, "JSON string ended unexpectedly searching for value of key " .. var_32_5)
			assert(var_24_1.sub(arg_32_0, arg_32_1, arg_32_1) == ":", "JSON object key-value assignment mal-formed at " .. arg_32_1)

			arg_32_1 = var_24_12(arg_32_0, arg_32_1 + 1)

			assert(arg_32_1 <= var_32_1, "JSON string ended unexpectedly searching for value of key " .. var_32_5)

			var_32_0[var_32_5], arg_32_1 = var_24_4.decode(arg_32_0, arg_32_1)
		until false
	end

	local var_24_16 = {
		["\\n"] = "\n",
		["\\t"] = "\t",
		["\\f"] = "\f",
		["\\r"] = "\r",
		["\\b"] = "\b"
	}

	setmetatable(var_24_16, {
		__index = function(arg_33_0, arg_33_1)
			return var_24_1.sub(arg_33_1, 2)
		end
	})

	function var_24_11(arg_34_0, arg_34_1)
		assert(arg_34_1, "decode_scanString(..) called without start position")

		local var_34_0 = var_24_1.sub(arg_34_0, arg_34_1, arg_34_1)

		assert(var_34_0 == "\"" or var_34_0 == "'", "decode_scanString called for a non-string")

		local var_34_1 = {}
		local var_34_2 = arg_34_1
		local var_34_3 = arg_34_1

		while var_24_1.find(arg_34_0, var_34_0, var_34_3 + 1) ~= var_34_3 + 1 do
			local var_34_4 = var_34_3
			local var_34_5

			var_34_5, var_34_3 = var_24_1.find(arg_34_0, "\\.", var_34_3 + 1)

			local var_34_6, var_34_7 = var_24_1.find(arg_34_0, var_34_0, var_34_4 + 1)

			if not var_34_5 or var_34_6 < var_34_5 then
				var_34_5, var_34_3 = var_34_6, var_34_7 - 1
			end

			var_24_2.insert(var_34_1, var_24_1.sub(arg_34_0, var_34_4 + 1, var_34_5 - 1))

			if var_24_1.sub(arg_34_0, var_34_5, var_34_3) == "\\u" then
				local var_34_8 = var_24_1.sub(arg_34_0, var_34_3 + 1, var_34_3 + 4)

				var_34_3 = var_34_3 + 4

				local var_34_9 = tonumber(var_34_8, 16)

				assert(var_34_9, "String decoding failed: bad Unicode escape " .. var_34_8 .. " at position " .. var_34_5 .. " : " .. var_34_3)

				local var_34_10

				if var_34_9 < 128 then
					var_34_10 = var_24_1.char(var_34_9 % 128)
				elseif var_34_9 < 2048 then
					var_34_10 = var_24_1.char(192 + var_24_0.floor(var_34_9 / 64) % 32, 128 + var_34_9 % 64)
				else
					var_34_10 = var_24_1.char(224 + var_24_0.floor(var_34_9 / 4096) % 16, 128 + var_24_0.floor(var_34_9 / 64) % 64, 128 + var_34_9 % 64)
				end

				var_24_2.insert(var_34_1, var_34_10)
			else
				var_24_2.insert(var_34_1, var_24_16[var_24_1.sub(arg_34_0, var_34_5, var_34_3)])
			end
		end

		var_24_2.insert(var_34_1, var_24_1.sub(var_34_3, var_34_3 + 1))
		assert(var_24_1.find(arg_34_0, var_34_0, var_34_3 + 1), "String decoding failed: missing closing " .. var_34_0 .. " at position " .. var_34_3 .. "(for string at position " .. arg_34_1 .. ")")

		return var_24_2.concat(var_34_1, ""), var_34_3 + 2
	end

	function var_24_12(arg_35_0, arg_35_1)
		local var_35_0 = " \n\r\t"
		local var_35_1 = var_24_1.len(arg_35_0)

		while var_24_1.find(var_35_0, var_24_1.sub(arg_35_0, arg_35_1, arg_35_1), 1, true) and arg_35_1 <= var_35_1 do
			arg_35_1 = arg_35_1 + 1
		end

		return arg_35_1
	end

	local var_24_17 = {
		["\f"] = "\\f",
		["\b"] = "\\b",
		["\\"] = "\\\\",
		["/"] = "\\/",
		["\""] = "\\\"",
		["\n"] = "\\n",
		["\r"] = "\\r",
		["\t"] = "\\t"
	}

	function var_24_5.encodeString(arg_36_0)
		return tostring(arg_36_0):gsub(".", function(arg_37_0)
			return var_24_17[arg_37_0]
		end)
	end

	function var_24_14(arg_38_0)
		if arg_38_0 == var_24_4.EMPTY_ARRAY then
			return true, 0
		end

		if arg_38_0 == var_24_4.EMPTY_OBJECT then
			return false
		end

		local var_38_0 = 0

		for iter_38_0, iter_38_1 in pairs(arg_38_0) do
			if type(iter_38_0) == "number" and var_24_0.floor(iter_38_0) == iter_38_0 and iter_38_0 >= 1 then
				if not var_24_15(iter_38_1) then
					return false
				end

				var_38_0 = var_24_0.max(var_38_0, iter_38_0)
			elseif iter_38_0 == "n" then
				if iter_38_1 ~= (arg_38_0.n or #arg_38_0) then
					return false
				end
			elseif var_24_15(iter_38_1) then
				return false
			end
		end

		return true, var_38_0
	end

	function var_24_15(arg_39_0)
		local var_39_0 = type(arg_39_0)

		return var_39_0 == "string" or var_39_0 == "boolean" or var_39_0 == "number" or var_39_0 == "nil" or var_39_0 == "table" or var_39_0 == "function" and arg_39_0 == var_24_4.null
	end

	return var_24_4
end

local var_0_13 = print
local var_0_14
local var_0_15
local var_0_16 = var_0_12()
local var_0_17 = {
	StepIn = false,
	Run = true,
	runLineCount = 0,
	StepNext = false,
	isProntToConsole = 1,
	version = "1.0.7",
	isHook = true,
	DebugLuaFie = "",
	isDebugPrint = true,
	StepOut = false,
	hookType = "lrc",
	fileMaps = {},
	breakInfos = {},
	pathCachePaths = {},
	splitFilePaths = {}
}
local var_0_18
local var_0_19 = coroutine.resume

function coroutine.resume(arg_40_0, ...)
	if var_0_17.isHook and coroutine.status(arg_40_0) ~= "dead" then
		debug.sethook(arg_40_0, var_0_18, "lrc")
	end

	return var_0_19(arg_40_0, ...)
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
		local var_41_0 = {
			...
		}
		local var_41_1 = ""

		if #var_41_0 == 0 then
			var_41_0 = {
				"nil"
			}
		end

		for iter_41_0, iter_41_1 in pairs(var_41_0) do
			var_41_1 = var_41_1 .. tostring(iter_41_1) .. "\t"
		end

		local var_41_2 = {
			event = var_0_17.event.C2S_LuaPrint,
			data = {
				type = 1,
				msg = var_0_6.encode(var_41_1)
			}
		}
		local var_41_3 = var_0_16.encode(var_41_2)

		var_0_14:send(var_41_3 .. "__debugger_k0204__")
	end
end

function luaIdePrintWarn(...)
	if var_0_17.isProntToConsole == 1 or var_0_17.isProntToConsole == 3 then
		var_0_13(...)
	end

	if (var_0_17.isProntToConsole == 1 or var_0_17.isProntToConsole == 2) and var_0_14 then
		local var_42_0 = {
			...
		}
		local var_42_1 = ""

		if #var_42_0 == 0 then
			var_42_0 = {
				"nil"
			}
		end

		for iter_42_0, iter_42_1 in pairs(var_42_0) do
			var_42_1 = var_42_1 .. tostring(iter_42_1) .. "\t"
		end

		local var_42_2 = {
			event = var_0_17.event.C2S_LuaPrint,
			data = {
				type = 2,
				msg = var_0_6.encode(var_42_1)
			}
		}
		local var_42_3 = var_0_16.encode(var_42_2)

		var_0_14:send(var_42_3 .. "__debugger_k0204__")
	end
end

function luaIdePrintErr(...)
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
				type = 3,
				msg = var_0_6.encode(var_43_1)
			}
		}
		local var_43_3 = var_0_16.encode(var_43_2)

		var_0_14:send(var_43_3 .. "__debugger_k0204__")
	end
end

local function var_0_20(arg_44_0, arg_44_1)
	local var_44_0 = string.find(arg_44_0, arg_44_1, 1)

	while var_44_0 do
		local var_44_1 = string.find(arg_44_0, arg_44_1, var_44_0 + 1)

		if not var_44_1 then
			break
		else
			var_44_0 = var_44_1
		end
	end

	return var_44_0
end

local function var_0_21(arg_45_0)
	local var_45_0, var_45_1 = string.find(arg_45_0, "/%.%./")

	if var_45_0 then
		local var_45_2 = string.sub(arg_45_0, 1, var_45_0 - 1)
		local var_45_3 = var_0_20(var_45_2, "/")
		local var_45_4 = string.sub(var_45_2, 1, var_45_3 - 1)
		local var_45_5 = string.sub(arg_45_0, var_45_1)

		arg_45_0 = var_45_4 .. var_45_5
		arg_45_0 = var_0_21(arg_45_0)

		return arg_45_0
	else
		return arg_45_0
	end
end

local function var_0_22(arg_46_0)
	local var_46_0
	local var_46_1

	arg_46_0 = arg_46_0:gsub("\\", "/")
	arg_46_0 = arg_46_0:gsub("//", "/")
	arg_46_0 = arg_46_0:gsub("/./", "/")

	if arg_46_0:find("@") == 1 then
		arg_46_0 = arg_46_0:sub(2)
	end

	if arg_46_0:find("%./") == 1 then
		arg_46_0 = arg_46_0:sub(3)
	end

	arg_46_0 = var_0_21(arg_46_0)

	local var_46_2 = string.len(arg_46_0)
	local var_46_3 = {
		".lua",
		".txt.lua",
		".txt",
		".bytes"
	}

	table.sort(var_46_3, function(arg_47_0, arg_47_1)
		return string.len(arg_47_0) > string.len(arg_47_1)
	end)

	local var_46_4 = {}

	for iter_46_0, iter_46_1 in ipairs(var_46_3) do
		table.insert(var_46_4, string.len(iter_46_1))
	end

	local var_46_5 = string.len(arg_46_0)

	for iter_46_2, iter_46_3 in ipairs(var_46_3) do
		if string.sub(arg_46_0, var_46_5 - var_46_4[iter_46_2] + 1) == iter_46_3 then
			arg_46_0 = string.sub(arg_46_0, 1, var_46_5 - var_46_4[iter_46_2])

			break
		end
	end

	local var_46_6 = var_0_20(arg_46_0, "/")

	if var_46_6 then
		var_46_0 = string.sub(arg_46_0, var_46_6 + 1)
		var_46_1 = string.sub(arg_46_0, 1, var_46_6)
		arg_46_0 = var_46_1 .. var_46_0
	else
		local var_46_7 = var_0_20(arg_46_0, "%.")

		if not var_46_7 then
			var_46_0 = arg_46_0
			var_46_1 = ""
		else
			var_46_1 = string.sub(arg_46_0, 1, var_46_7)
			var_46_1 = var_46_1:gsub("%.", "/")
			var_46_0 = string.sub(arg_46_0, var_46_7 + 1)
			arg_46_0 = var_46_1 .. var_46_0
		end
	end

	return arg_46_0, var_46_1, var_46_0
end

local function var_0_23(arg_48_0, arg_48_1)
	arg_48_0 = tostring(arg_48_0)
	arg_48_1 = tostring(arg_48_1)

	if arg_48_1 == "" then
		return false
	end

	local var_48_0 = 0
	local var_48_1 = {}

	for iter_48_0, iter_48_1 in function()
		return string.find(arg_48_0, arg_48_1, var_48_0, true)
	end do
		table.insert(var_48_1, string.sub(arg_48_0, var_48_0, iter_48_0 - 1))

		var_48_0 = iter_48_1 + 1
	end

	table.insert(var_48_1, string.sub(arg_48_0, var_48_0))

	return var_48_1
end

local function var_0_24(arg_50_0)
	arg_50_0 = string.gsub(arg_50_0, "^[ \t\n\r]+", "")

	return string.gsub(arg_50_0, "[ \t\n\r]+$", "")
end

local function var_0_25(arg_51_0, arg_51_1, arg_51_2)
	if type(arg_51_2) ~= "number" then
		arg_51_2 = 3
	end

	local var_51_0 = {}
	local var_51_1 = {}

	local function var_51_2(arg_52_0)
		if type(arg_52_0) == "string" then
			arg_52_0 = "\"" .. arg_52_0 .. "\""
		end

		return tostring(arg_52_0)
	end

	local var_51_3 = var_0_23(debug.traceback("", 2), "\n")

	print("dump from: " .. var_0_24(var_51_3[3]))

	local function var_51_4(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4)
		arg_53_1 = arg_53_1 or "<var>"

		local var_53_0 = ""

		if type(arg_53_4) == "number" then
			var_53_0 = string.rep(" ", arg_53_4 - string.len(var_51_2(arg_53_1)))
		end

		if type(arg_53_0) ~= "table" then
			var_51_1[#var_51_1 + 1] = string.format("%s%s%s = %s", arg_53_2, var_51_2(arg_53_1), var_53_0, var_51_2(arg_53_0))
		elseif var_51_0[arg_53_0] then
			var_51_1[#var_51_1 + 1] = string.format("%s%s%s = *REF*", arg_53_2, arg_53_1, var_53_0)
		else
			var_51_0[arg_53_0] = true

			if arg_53_3 > arg_51_2 then
				var_51_1[#var_51_1 + 1] = string.format("%s%s = *MAX NESTING*", arg_53_2, arg_53_1)
			else
				var_51_1[#var_51_1 + 1] = string.format("%s%s = {", arg_53_2, var_51_2(arg_53_1))

				local var_53_1 = arg_53_2 .. "    "
				local var_53_2 = {}
				local var_53_3 = 0
				local var_53_4 = {}

				for iter_53_0, iter_53_1 in pairs(arg_53_0) do
					var_53_2[#var_53_2 + 1] = iter_53_0

					local var_53_5 = var_51_2(iter_53_0)
					local var_53_6 = string.len(var_53_5)

					if var_53_3 < var_53_6 then
						var_53_3 = var_53_6
					end

					var_53_4[iter_53_0] = iter_53_1
				end

				table.sort(var_53_2, function(arg_54_0, arg_54_1)
					if type(arg_54_0) == "number" and type(arg_54_1) == "number" then
						return arg_54_0 < arg_54_1
					else
						return tostring(arg_54_0) < tostring(arg_54_1)
					end
				end)

				for iter_53_2, iter_53_3 in ipairs(var_53_2) do
					var_51_4(var_53_4[iter_53_3], iter_53_3, var_53_1, arg_53_3 + 1, var_53_3)
				end

				var_51_1[#var_51_1 + 1] = string.format("%s}", arg_53_2)
			end
		end
	end

	var_51_4(arg_51_0, arg_51_1, "- ", 1)

	for iter_51_0, iter_51_1 in ipairs(var_51_1) do
		print(iter_51_1)
	end
end

local function var_0_26(arg_55_0, arg_55_1)
	local var_55_0 = type(arg_55_1)
	local var_55_1 = ""

	if var_55_0 ~= "table" then
		var_55_1 = tostring(arg_55_1)
		var_55_1 = var_0_6.encode(var_55_1)
	elseif var_0_17.isFoxGloryProject then
		var_55_1 = var_0_6.encode("table")
	else
		local var_55_2, var_55_3 = xpcall(function()
			var_55_1 = tostring(arg_55_1)
			var_55_1 = var_0_6.encode(var_55_1)
		end, function(arg_57_0)
			var_55_1 = var_0_6.encode("table")
		end)
	end

	return {
		name = arg_55_0,
		valueType = var_55_0,
		valueStr = var_55_1
	}
end

local function var_0_27(arg_58_0)
	local var_58_0 = 1
	local var_58_1 = {}

	while true do
		local var_58_2, var_58_3 = debug.getlocal(arg_58_0, var_58_0)

		if not var_58_2 then
			break
		end

		if var_58_2 ~= "(*temporary)" then
			var_58_1[var_58_2] = var_58_3
		end

		var_58_0 = var_58_0 + 1
	end

	local var_58_4 = var_0_10(arg_58_0, "f").func
	local var_58_5 = 1
	local var_58_6 = {}

	while var_58_4 do
		local var_58_7, var_58_8 = debug.getupvalue(var_58_4, var_58_5)

		if not var_58_7 then
			break
		end

		if var_58_7 == "_ENV" then
			var_58_6._ENV_ = var_58_8
		else
			var_58_6[var_58_7] = var_58_8
		end

		var_58_5 = var_58_5 + 1
	end

	return {
		locals = var_58_1,
		ups = var_58_6
	}
end

local function var_0_28(arg_59_0, arg_59_1)
	local var_59_0 = {}
	local var_59_1 = {}
	local var_59_2 = {}
	local var_59_3 = {}
	local var_59_4 = 0

	for iter_59_0 = arg_59_0, 100 do
		local var_59_5 = var_0_10(iter_59_0)
		local var_59_6 = true

		if iter_59_0 == arg_59_0 then
			local var_59_7 = var_59_5.source

			if var_59_7:find(var_0_17.DebugLuaFie) then
				return
			end

			if var_59_7 == "=[C]" then
				var_59_6 = false
			end
		end

		if not var_59_5 then
			break
		end

		if var_59_6 then
			local var_59_8, var_59_9, var_59_10 = var_0_22(var_59_5.source)
			local var_59_11 = {
				src = var_59_8,
				scoreName = var_59_5.name,
				currentline = var_59_5.currentline,
				linedefined = var_59_5.linedefined,
				what = var_59_5.what,
				nameWhat = var_59_5.namewhat
			}
			local var_59_12 = iter_59_0
			local var_59_13 = var_0_27(iter_59_0 + 1)

			table.insert(var_59_1, var_59_11)
			table.insert(var_59_2, var_59_13)
			table.insert(var_59_3, var_59_5.func)
		end

		if var_59_5.what == "main" then
			break
		end
	end

	local var_59_14 = {
		stack = var_59_1,
		vars = var_59_2,
		funcs = var_59_3
	}

	return {
		stack = var_59_14.stack,
		vars = var_59_14.vars,
		funcs = var_59_14.funcs,
		event = arg_59_1,
		funcsLength = #var_59_14.funcs
	}
end

local var_0_29

local function var_0_30()
	if not jit then
		if _VERSION then
			print("当前lua版本为: " .. _VERSION .. " 请使用 -----LuaDebug.lua----- 进行调试!")
		else
			print("当前为lua版本,请使用-----LuaDebug.lua-----进行调试!")
		end
	end

	if var_0_15 then
		local var_60_0, var_60_1 = var_0_15:receive()

		if var_60_0 then
			local var_60_2 = var_0_16.decode(var_60_0)

			if var_60_2.event == var_0_17.event.S2C_SetBreakPoints then
				var_0_29(var_60_2.data)
			elseif var_60_2.event == var_0_17.event.S2C_LoadLuaScript then
				var_0_4(var_60_2.data, false)
			end
		end
	end
end

local function var_0_31(arg_61_0)
	if var_0_17.splitFilePaths[arg_61_0] then
		return var_0_17.splitFilePaths[arg_61_0]
	end

	local var_61_0 = 0
	local var_61_1 = {}

	for iter_61_0, iter_61_1 in function()
		return string.find(arg_61_0, "/", var_61_0, true)
	end do
		local var_61_2 = string.sub(arg_61_0, var_61_0, iter_61_0 - 1)

		table.insert(var_61_1, var_61_2)

		var_61_0 = iter_61_1 + 1
	end

	local var_61_3 = string.sub(arg_61_0, var_61_0)

	table.insert(var_61_1, var_61_3)

	var_0_17.splitFilePaths[arg_61_0] = var_61_1

	return var_61_1
end

function var_0_29(arg_63_0)
	local var_63_0 = var_0_17.breakInfos

	for iter_63_0, iter_63_1 in ipairs(arg_63_0) do
		iter_63_1.fileName = string.lower(iter_63_1.fileName)
		iter_63_1.serverPath = string.lower(iter_63_1.serverPath)

		local var_63_1 = var_63_0[iter_63_1.fileName]

		if not var_63_1 then
			var_63_0[iter_63_1.fileName] = {}
			var_63_1 = var_63_0[iter_63_1.fileName]
		end

		if not iter_63_1.breakDatas or #iter_63_1.breakDatas == 0 then
			var_63_1[iter_63_1.serverPath] = nil
		else
			local var_63_2 = var_63_1[iter_63_1.serverPath]

			if not var_63_2 then
				var_63_2 = {
					pathNames = var_0_31(iter_63_1.serverPath),
					hitCounts = {}
				}
				var_63_1[iter_63_1.serverPath] = var_63_2
			end

			local var_63_3 = {}

			for iter_63_2, iter_63_3 in ipairs(iter_63_1.breakDatas) do
				var_63_3[iter_63_3.line] = iter_63_3

				if iter_63_3.hitCondition and iter_63_3.hitCondition ~= "" then
					iter_63_3.hitCondition = tonumber(iter_63_3.hitCondition)
				else
					iter_63_3.hitCondition = 0
				end

				if not var_63_2.hitCounts[iter_63_3.line] then
					var_63_2.hitCounts[iter_63_3.line] = 0
				end
			end

			var_63_2.lines = var_63_3

			for iter_63_4, iter_63_5 in pairs(var_63_2.hitCounts) do
				if not var_63_3[iter_63_4] then
					var_63_2.hitCounts[iter_63_4] = nil
				end
			end
		end

		local var_63_4 = 0

		for iter_63_6, iter_63_7 in pairs(var_63_1) do
			var_63_4 = var_63_4 + 1
		end

		if var_63_4 == 0 then
			var_63_0[iter_63_1.fileName] = nil
		end
	end

	local var_63_5 = false

	for iter_63_8, iter_63_9 in pairs(var_63_0) do
		var_63_5 = true

		break
	end

	if var_63_5 then
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

local function var_0_32(arg_64_0)
	return var_0_17.breakInfos[arg_64_0]
end

local var_0_33 = "192.168.1.102"
local var_0_34 = 7003

local function var_0_35(arg_65_0, arg_65_1, arg_65_2)
	local var_65_0 = {
		event = arg_65_1,
		data = arg_65_2
	}
	local var_65_1 = var_0_16.encode(var_65_0)

	arg_65_0:send(var_65_1 .. "__debugger_k0204__")
end

function debugger_conditionStr(arg_66_0, arg_66_1, arg_66_2)
	local function var_66_0()
		local var_67_0 = {}
		local var_67_1 = arg_66_1[1].locals
		local var_67_2 = arg_66_1[1].ups

		if var_67_2 then
			for iter_67_0, iter_67_1 in pairs(var_67_2) do
				var_67_0[iter_67_0] = iter_67_1
			end
		end

		if var_67_1 then
			for iter_67_2, iter_67_3 in pairs(var_67_1) do
				var_67_0[iter_67_2] = iter_67_3
			end
		end

		setmetatable(var_67_0, {
			__index = _G
		})

		local var_67_3 = var_0_9("return " .. arg_66_0)

		setfenv(var_67_3, var_67_0)

		return var_67_3()
	end

	local var_66_1, var_66_2 = xpcall(var_66_0, function(arg_68_0)
		print(arg_68_0)
	end)

	if var_66_1 and var_66_2 then
		arg_66_2()
	end
end

function var_0_4(arg_69_0, arg_69_1)
	local function var_69_0()
		local var_70_0 = arg_69_0.luastr

		if arg_69_1 then
			local var_70_1 = {
				_G = _G
			}
			local var_70_2 = arg_69_0.frameId + 1
			local var_70_3 = var_0_17.currentDebuggerData.funcs[var_70_2]
			local var_70_4 = var_0_17.currentDebuggerData.vars[var_70_2]
			local var_70_5 = var_70_4.locals
			local var_70_6 = var_70_4.ups

			for iter_70_0, iter_70_1 in pairs(var_70_6) do
				var_70_1[iter_70_0] = iter_70_1
			end

			for iter_70_2, iter_70_3 in pairs(var_70_5) do
				var_70_1[iter_70_2] = iter_70_3
			end

			setmetatable(var_70_1, {
				__index = _G
			})

			local var_70_7 = var_0_9(var_70_0)

			setfenv(var_70_7, var_70_1)
			var_70_7()
		else
			var_0_9(var_70_0)()
		end
	end

	local var_69_1, var_69_2 = xpcall(var_69_0, function(arg_71_0)
		print(arg_71_0)
	end)

	if var_69_1 then
		var_0_35(var_0_14, var_0_17.event.C2S_LoadLuaScript, {
			msg = "执行代码成功"
		})

		if arg_69_1 then
			var_0_35(var_0_14, var_0_17.event.C2S_HITBreakPoint, var_0_17.currentDebuggerData.stack)
		end
	else
		var_0_35(var_0_14, var_0_17.event.C2S_LoadLuaScript, {
			msg = "加载代码失败"
		})
	end
end

local function var_0_36(arg_72_0)
	arg_72_0 = string.lower(arg_72_0)

	if var_0_17.pathCachePaths[arg_72_0] then
		var_0_17.currentLineFile = var_0_17.pathCachePaths[arg_72_0]

		return var_0_17.pathCachePaths[arg_72_0]
	end

	local var_72_0, var_72_1, var_72_2 = var_0_22(arg_72_0)

	var_0_17.currentLineFile = var_72_0
	var_0_17.pathCachePaths[arg_72_0] = var_72_2

	return var_72_2
end

local function var_0_37(arg_73_0, arg_73_1)
	local var_73_0 = var_0_8.getUserDataInfo(arg_73_1)
	local var_73_1 = {}

	if tolua and tolua.getpeer then
		local var_73_2 = tolua.getpeer(arg_73_1)

		if var_73_2 then
			for iter_73_0, iter_73_1 in pairs(var_73_2) do
				local var_73_3 = var_0_26(iter_73_0, iter_73_1)

				table.insert(var_73_1, var_73_3)
			end
		end
	end

	for iter_73_2 = 1, var_73_0.Count do
		local var_73_4 = var_73_0[iter_73_2 - 1]
		local var_73_5 = {
			csharp = true,
			name = var_73_4.name,
			valueType = var_73_4.valueType,
			valueStr = var_0_6.encode(var_73_4.valueStr),
			isValue = var_73_4.isValue
		}

		table.insert(var_73_1, var_73_5)
	end

	return var_73_1
end

local function var_0_38(arg_74_0, arg_74_1)
	local var_74_0
	local var_74_1, var_74_2 = xpcall(function()
		local var_75_0 = var_0_9("return " .. arg_74_1)

		setfenv(var_75_0, arg_74_0)

		var_74_0 = var_75_0()
	end, function(arg_76_0)
		print(arg_76_0, "====>")

		var_74_0 = nil
	end)

	return var_74_0
end

local function var_0_39(arg_77_0, arg_77_1, arg_77_2)
	local var_77_0 = ""

	for iter_77_0 = arg_77_2, #arg_77_1 do
		local var_77_1 = arg_77_1[iter_77_0]

		if var_77_1 == "[metatable]" then
			-- block empty
		elseif iter_77_0 == arg_77_2 then
			if string.find(var_77_1, "%.") then
				if var_77_0 == "" then
					iter_77_0 = arg_77_2 + 1
					arg_77_0 = arg_77_0[var_77_1]
				end

				if iter_77_0 >= #arg_77_1 then
					return arg_77_2, arg_77_0
				end

				return var_0_39(arg_77_0, arg_77_1, iter_77_0)
			else
				var_77_0 = var_77_1
			end
		elseif string.find(var_77_1, "%[") then
			var_77_0 = var_77_0 .. var_77_1
		elseif type(var_77_1) == "string" then
			var_77_0 = var_77_0 .. "[\"" .. var_77_1 .. "\"]"
		else
			var_77_0 = var_77_0 .. "[" .. var_77_1 .. "]"
		end
	end

	local var_77_2 = var_0_38(arg_77_0, var_77_0)

	return #arg_77_1, var_77_2
end

local function var_0_40(arg_78_0, arg_78_1, arg_78_2)
	local var_78_0 = arg_78_2[arg_78_1]
	local var_78_1 = var_0_8.getCSharpValue(arg_78_0, var_78_0)

	if var_78_1 then
		if arg_78_1 == #arg_78_2 then
			return #arg_78_2, var_78_1
		else
			local var_78_2, var_78_3 = var_0_40(var_78_1, arg_78_1 + 1, arg_78_2)

			if not var_78_3 then
				local var_78_4 = {}

				for iter_78_0 = var_78_2, #arg_78_2 do
					table.insert(var_78_4, arg_78_2[iter_78_0])
				end

				local var_78_5, var_78_6 = debugger_searchVarByKeys(arg_78_0, searckKeys, 1)

				return var_78_5, var_78_6
			else
				return var_78_2, var_78_3
			end
		end
	else
		return arg_78_1, var_78_1
	end
end

local function var_0_41(arg_79_0, arg_79_1, arg_79_2)
	local var_79_0, var_79_1 = var_0_39(arg_79_0, arg_79_2, 1)

	if not var_0_8 then
		return var_79_0, var_79_1
	end

	if var_79_1 then
		if var_79_0 == #arg_79_1 then
			return var_79_0, var_79_1
		else
			local var_79_2 = ""
			local var_79_3 = #arg_79_1
			local var_79_4 = var_79_0 + 1
			local var_79_5, var_79_6 = var_0_40(var_79_1, var_79_4, arg_79_1)

			return var_79_5, var_79_6
		end
	else
		local var_79_7 = {}

		for iter_79_0 = 1, #arg_79_2 - 1 do
			table.insert(var_79_7, arg_79_1[iter_79_0])
		end

		if #var_79_7 == 0 then
			return #arg_79_1, nil
		end

		return var_0_41(arg_79_0, arg_79_1, var_79_7)
	end
end

local function var_0_42(arg_80_0, arg_80_1, arg_80_2, arg_80_3, arg_80_4, arg_80_5, arg_80_6)
	for iter_80_0, iter_80_1 in ipairs(arg_80_6) do
		if arg_80_1 == iter_80_1 then
			return arg_80_2
		end
	end

	table.insert(arg_80_6, arg_80_1)

	for iter_80_2, iter_80_3 in pairs(arg_80_1) do
		local var_80_0

		if type(iter_80_2) == "string" then
			xpcall(function()
				var_80_0 = arg_80_0[iter_80_2]
			end, function(arg_82_0)
				var_80_0 = nil
			end)

			if var_80_0 == nil then
				xpcall(function()
					if string.find(iter_80_2, "__") then
						var_80_0 = iter_80_3
					end
				end, function(arg_84_0)
					var_80_0 = nil
				end)
			end
		end

		if var_80_0 then
			local var_80_1 = var_0_26(iter_80_2, var_80_0)

			table.insert(arg_80_2, var_80_1)

			if #arg_80_2 > 10 then
				var_0_35(arg_80_3, var_0_17.event.C2S_ReqVar, {
					isComplete = 0,
					variablesReference = arg_80_4,
					debugSpeedIndex = arg_80_5,
					vars = arg_80_2
				})

				arg_80_2 = {}
			end
		end
	end

	local var_80_2 = getmetatable(arg_80_1)

	if var_80_2 then
		return var_0_42(arg_80_0, var_80_2, arg_80_2, arg_80_3, arg_80_4, arg_80_5, arg_80_6)
	else
		return arg_80_2
	end
end

local function var_0_43(arg_85_0, arg_85_1, arg_85_2, arg_85_3, arg_85_4, arg_85_5)
	if arg_85_5 == "userdata" then
		if tolua and tolua.getpeer then
			arg_85_0 = tolua.getpeer(arg_85_0)
		else
			return arg_85_1
		end
	end

	if arg_85_0 == nil then
		return arg_85_1
	end

	for iter_85_0, iter_85_1 in pairs(arg_85_0) do
		local var_85_0 = var_0_26(iter_85_0, iter_85_1)

		table.insert(arg_85_1, var_85_0)

		if #arg_85_1 > 10 then
			var_0_35(arg_85_2, var_0_17.event.C2S_ReqVar, {
				isComplete = 0,
				variablesReference = arg_85_3,
				debugSpeedIndex = arg_85_4,
				vars = arg_85_1
			})

			arg_85_1 = {}
		end
	end

	return arg_85_1
end

local function var_0_44(arg_86_0, arg_86_1, arg_86_2, arg_86_3)
	local var_86_0 = {}
	local var_86_1 = {}
	local var_86_2 = type(arg_86_0)
	local var_86_3 = {}
	local var_86_4

	if var_86_2 == "userdata" then
		if tolua and tolua.getpeer then
			var_86_4 = getmetatable(arg_86_0)
			var_86_0 = var_0_43(arg_86_0, var_86_0, arg_86_1, arg_86_2, arg_86_3, var_86_2)
		end

		if var_0_8 then
			local var_86_5 = var_0_37(arg_86_1, arg_86_0, arg_86_2, arg_86_3)

			for iter_86_0, iter_86_1 in ipairs(var_86_5) do
				if iter_86_1.valueType == "System.Byte[]" and arg_86_0[iter_86_1.name] and type(arg_86_0[iter_86_1.name]) == "string" then
					local var_86_6 = {
						valueType = "string",
						name = iter_86_1.name,
						valueStr = var_0_6.encode(arg_86_0[iter_86_1.name])
					}

					table.insert(var_86_0, var_86_6)
				else
					table.insert(var_86_0, iter_86_1)
				end

				if #var_86_0 > 10 then
					var_0_35(arg_86_1, var_0_17.event.C2S_ReqVar, {
						isComplete = 0,
						variablesReference = arg_86_2,
						debugSpeedIndex = arg_86_3,
						vars = var_86_0
					})

					var_86_0 = {}
				end
			end

			var_86_4 = getmetatable(arg_86_0)
		end
	else
		var_86_4 = getmetatable(arg_86_0)
		var_86_0 = var_0_43(arg_86_0, var_86_0, arg_86_1, arg_86_2, arg_86_3, var_86_2)
	end

	if var_86_4 then
		var_86_0 = var_0_42(arg_86_0, var_86_4, var_86_0, arg_86_1, arg_86_2, arg_86_3, {})
	end

	var_0_35(arg_86_1, var_0_17.event.C2S_ReqVar, {
		isComplete = 1,
		variablesReference = arg_86_2,
		debugSpeedIndex = arg_86_3,
		vars = var_86_0
	})
end

local function var_0_45(arg_87_0, arg_87_1)
	local var_87_0 = arg_87_0.variablesReference
	local var_87_1 = arg_87_0.debugSpeedIndex
	local var_87_2 = {}

	local function var_87_3()
		local var_88_0 = arg_87_0.frameId
		local var_88_1 = arg_87_0.type
		local var_88_2 = arg_87_0.keys
		local var_88_3

		if var_88_1 == 1 then
			var_88_3 = var_0_17.currentDebuggerData.vars[var_88_0 + 1]
			var_88_3 = var_88_3.locals
		elseif var_88_1 == 2 then
			var_88_3 = var_0_17.currentDebuggerData.vars[var_88_0 + 1]
			var_88_3 = var_88_3.ups
		elseif var_88_1 == 3 then
			var_88_3 = _G
		end

		if #var_88_2 == 0 then
			var_0_44(var_88_3, arg_87_1, var_87_0, var_87_1)

			return
		end

		local var_88_4, var_88_5 = var_0_41(var_88_3, var_88_2, var_88_2)

		if var_88_5 then
			local var_88_6 = type(var_88_5)

			if var_88_6 == "table" or var_88_6 == "userdata" then
				var_0_44(var_88_5, arg_87_1, var_87_0, var_87_1)
			else
				if var_88_6 == "function" then
					var_88_5 = tostring(var_88_5)
				end

				var_0_35(arg_87_1, var_0_17.event.C2S_ReqVar, {
					isComplete = 1,
					variablesReference = var_87_0,
					debugSpeedIndex = var_87_1,
					vars = var_0_6.encode(var_88_5),
					varType = var_88_6
				})
			end
		else
			var_0_35(arg_87_1, var_0_17.event.C2S_ReqVar, {
				isComplete = 1,
				varType = "nil",
				variablesReference = var_87_0,
				debugSpeedIndex = var_87_1,
				vars = {}
			})
		end
	end

	xpcall(var_87_3, function(arg_89_0)
		var_0_35(arg_87_1, var_0_17.event.C2S_ReqVar, {
			isComplete = 1,
			variablesReference = var_87_0,
			debugSpeedIndex = var_87_1,
			vars = {
				{
					isValue = false,
					name = "error",
					valueType = "string",
					valueStr = var_0_6.encode("无法获取属性值:" .. arg_89_0 .. "->" .. debug.traceback("", 2))
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
end

local function var_0_47(arg_91_0)
	arg_91_0 = var_0_14

	local var_91_0
	local var_91_1 = {}
	local var_91_2

	while true do
		local var_91_3, var_91_4 = arg_91_0:receive()

		if var_91_4 == "closed" then
			debug.sethook()
			coroutine.yield()
		end

		if var_91_3 then
			local var_91_5 = var_0_16.decode(var_91_3)
			local var_91_6 = var_91_5.event
			local var_91_7 = var_91_5.data

			if var_91_6 == var_0_17.event.S2C_DebugClose then
				debug.sethook()
				coroutine.yield()
			elseif var_91_6 == var_0_17.event.S2C_SetBreakPoints then
				local function var_91_8()
					var_0_29(var_91_7)
				end

				xpcall(var_91_8, function(arg_93_0)
					print(arg_93_0)
				end)
			elseif var_91_6 == var_0_17.event.S2C_RUN then
				var_0_17.runTimeType = var_91_7.runTimeType
				var_0_17.isProntToConsole = var_91_7.isProntToConsole
				var_0_17.isFoxGloryProject = var_91_7.isFoxGloryProject

				var_0_46()

				var_0_17.currentDebuggerData = nil
				var_0_17.Run = true
				var_0_17.tempRunFlag = true

				local var_91_9 = coroutine.yield()

				var_0_17.currentDebuggerData = var_91_9

				var_0_35(arg_91_0, var_91_9.event, {
					stack = var_91_9.stack
				})
			elseif var_91_6 == var_0_17.event.S2C_ReqVar then
				var_0_45(var_91_7, arg_91_0)
			elseif var_91_6 == var_0_17.event.S2C_NextRequest then
				var_0_46()

				var_0_17.StepNext = true

				local var_91_10 = coroutine.yield()

				var_0_17.currentDebuggerData = var_91_10

				var_0_35(arg_91_0, var_91_10.event, {
					stack = var_91_10.stack
				})
			elseif var_91_6 == var_0_17.event.S2C_StepInRequest then
				var_0_46()

				var_0_17.StepIn = true

				local var_91_11 = coroutine.yield()

				var_0_17.currentDebuggerData = var_91_11

				var_0_35(arg_91_0, var_91_11.event, {
					stack = var_91_11.stack,
					eventType = var_91_11.eventType
				})
			elseif var_91_6 == var_0_17.event.S2C_StepOutRequest then
				var_0_46()

				var_0_17.StepOut = true

				local var_91_12 = coroutine.yield()

				var_0_17.currentDebuggerData = var_91_12

				var_0_35(arg_91_0, var_91_12.event, {
					stack = var_91_12.stack,
					eventType = var_91_12.eventType
				})
			elseif var_91_6 == var_0_17.event.S2C_LoadLuaScript then
				var_0_4(var_91_7, true)
			end
		end
	end
end

local var_0_48 = coroutine.create(var_0_47)

function var_0_18(arg_94_0, arg_94_1)
	if not var_0_17.isHook then
		return
	end

	if var_0_17.Run and arg_94_0 == "line" then
		local var_94_0 = false

		for iter_94_0, iter_94_1 in pairs(var_0_17.breakInfos) do
			for iter_94_2, iter_94_3 in pairs(iter_94_1) do
				if iter_94_3.lines and iter_94_3.lines[arg_94_1] then
					var_94_0 = true

					break
				end
			end

			if var_94_0 then
				break
			end
		end

		if not var_94_0 then
			return
		end
	end

	local var_94_1

	if arg_94_0 == "line" then
		local var_94_2
		local var_94_3 = 0

		if var_0_17.currentDebuggerData then
			var_94_2 = var_0_17.currentDebuggerData.funcs
			var_94_3 = #var_94_2
		end

		local var_94_4 = var_0_10(2)
		local var_94_5 = var_94_4.func
		local var_94_6 = var_94_4.source
		local var_94_7 = var_0_36(var_94_6)

		if var_94_6 == "=[C]" or var_94_6:find(var_0_17.DebugLuaFie) then
			return
		end

		if var_94_3 > 0 and var_94_2[1] == var_94_5 and var_0_17.currentLine ~= arg_94_1 then
			var_0_17.runLineCount = var_0_17.runLineCount + 1
		end

		local var_94_8 = var_0_17.breakInfos[var_94_7]
		local var_94_9
		local var_94_10 = false

		if var_94_8 then
			for iter_94_4, iter_94_5 in pairs(var_94_8) do
				local var_94_11 = iter_94_5.lines

				if var_94_11 and var_94_11[arg_94_1] then
					var_94_10 = true

					break
				end
			end
		end

		local var_94_12 = false

		if var_94_10 then
			local var_94_13 = var_94_4
			local var_94_14 = string.lower(var_94_13.source)
			local var_94_15, var_94_16, var_94_17 = var_0_22(var_94_14)
			local var_94_18 = var_0_31(var_94_15)
			local var_94_19 = {}
			local var_94_20

			for iter_94_6, iter_94_7 in pairs(var_94_8) do
				local var_94_21 = iter_94_7.lines
				local var_94_22 = iter_94_7.pathNames

				var_94_20 = iter_94_7.hitCounts

				if var_94_21 and var_94_21[arg_94_1] then
					var_94_9 = var_94_21[arg_94_1]
					var_94_19[iter_94_6] = 0

					local var_94_23 = #var_94_18
					local var_94_24 = #var_94_22

					repeat
						if var_94_22[var_94_24] ~= var_94_18[var_94_23] then
							break
						else
							var_94_19[iter_94_6] = var_94_19[iter_94_6] + 1
						end

						var_94_24 = var_94_24 - 1
						var_94_23 = var_94_23 - 1
					until var_94_24 <= 0 or var_94_23 <= 0
				else
					var_94_9 = nil
				end
			end

			if var_94_9 then
				local var_94_25 = ""
				local var_94_26 = 0

				for iter_94_8, iter_94_9 in pairs(var_94_19) do
					if var_94_26 < iter_94_9 then
						var_94_26 = iter_94_9
						var_94_25 = iter_94_8
					end
				end

				if (#var_94_18 == 1 or #var_94_18 > 1 and var_94_26 > 1) and var_94_25 ~= "" then
					local var_94_27 = var_94_9.hitCondition
					local var_94_28 = var_94_20[var_94_9.line] + 1

					var_94_20[var_94_9.line] = var_94_28

					if var_94_2 and var_94_2[1] == var_94_5 and var_0_17.runLineCount == 0 then
						var_0_17.runLineCount = 0
					elseif var_0_17.tempRunFlag and var_0_17.currentLine == arg_94_1 then
						var_0_17.runLineCount = 0
						var_0_17.tempRunFlag = nil
					elseif var_94_27 <= var_94_28 then
						var_94_12 = true
					end
				end
			end
		end

		if var_0_17.StepOut then
			if var_94_3 == 1 then
				var_0_46()

				var_0_17.Run = true

				return
			elseif var_94_2[2] == var_94_5 then
				local var_94_29 = var_0_28(3, var_0_17.event.C2S_StepInResponse)

				var_0_19(var_0_48, var_94_29)

				return
			end
		end

		if var_0_17.StepIn then
			if var_94_2[1] == var_94_5 and var_0_17.runLineCount == 0 then
				return
			end

			local var_94_30 = var_0_28(3, var_0_17.event.C2S_StepInResponse)

			var_0_19(var_0_48, var_94_30)

			return
		end

		if var_0_17.StepNext then
			local var_94_31 = false

			if var_94_2 then
				for iter_94_10, iter_94_11 in ipairs(var_94_2) do
					if var_94_5 == iter_94_11 then
						if var_0_17.currentLine == arg_94_1 then
							return
						end

						var_94_31 = true

						break
					end
				end
			else
				var_94_31 = true
			end

			if var_94_31 then
				local var_94_32 = var_0_28(3, var_0_17.event.C2S_NextResponse)

				var_0_17.runLineCount = 0
				var_0_17.currentLine = arg_94_1

				var_0_19(var_0_48, var_94_32)

				return
			end
		end

		local var_94_33

		if var_94_12 then
			var_0_17.runLineCount = 0
			var_0_17.currentLine = arg_94_1

			local var_94_34 = var_0_17.event.C2S_HITBreakPoint
			local var_94_35 = var_0_28(3, var_94_34)

			if var_94_9 and var_94_9.condition then
				debugger_conditionStr(var_94_9.condition, var_94_35.vars, function()
					var_0_19(var_0_48, var_94_35)
				end)
			else
				var_0_19(var_0_48, var_94_35)
			end
		end
	end
end

local function var_0_49()
	local var_96_0 = var_0_28(4, var_0_17.event.C2S_HITBreakPoint)

	var_0_19(var_0_48, var_96_0)
end

local function var_0_50()
	local var_97_0 = var_0_11()

	print(var_0_33)
	print(var_0_34)

	local var_97_1, var_97_2, var_97_3 = var_0_22(var_0_10(1).source)

	var_0_17.DebugLuaFie = var_97_3

	local var_97_4 = var_97_0.connect(var_0_33, var_0_34)

	var_0_14 = var_97_4

	if var_97_4 then
		var_0_15 = var_0_11().connect(var_0_33, var_0_34)

		if var_0_15 then
			var_0_15:settimeout(0)
			var_0_35(var_0_15, var_0_17.event.C2S_SetSocketName, {
				name = "breakPointSocket"
			})
			var_0_35(var_97_4, var_0_17.event.C2S_SetSocketName, {
				name = "mainSocket",
				version = var_0_17.version
			})
			xpcall(function()
				var_0_0(var_0_18, "lrc")
			end, function(arg_99_0)
				print("error:", arg_99_0)
			end)

			if not jit then
				if _VERSION then
					print("当前lua版本为: " .. _VERSION .. " 请使用LuaDebug 进行调试!")
				else
					print("当前为lua版本,请使用LuaDebug 进行调试!")
				end
			end

			var_0_19(var_0_48, var_97_4)
		end
	end
end

function StartDebug(arg_100_0, arg_100_1)
	if not arg_100_0 then
		print("error host nil")
	end

	if not arg_100_1 then
		print("error prot nil")
	end

	if type(arg_100_0) ~= "string" then
		print("error host not string")
	end

	if type(arg_100_1) ~= "number" then
		print("error host not number")
	end

	var_0_33 = arg_100_0
	var_0_34 = arg_100_1

	xpcall(var_0_50, function(arg_101_0)
		print(arg_101_0)
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

function var_0_6.encode(arg_102_0)
	local var_102_0 = var_0_51.len(arg_102_0)
	local var_102_1 = var_102_0 % 3
	local var_102_2 = var_102_0 - var_102_1
	local var_102_3 = {}
	local var_102_4 = 1

	for iter_102_0 = 1, var_102_2, 3 do
		local var_102_5 = var_0_51.byte(arg_102_0, iter_102_0)
		local var_102_6 = var_0_51.byte(arg_102_0, iter_102_0 + 1)
		local var_102_7 = var_0_51.byte(arg_102_0, iter_102_0 + 2)
		local var_102_8 = var_102_5 * 65536 + var_102_6 * 256 + var_102_7

		for iter_102_1 = 1, 4 do
			local var_102_9 = math.floor(var_102_8 / 2^((4 - iter_102_1) * 6)) % 64 + 1

			var_102_3[var_102_4] = var_0_6.__code[var_102_9]
			var_102_4 = var_102_4 + 1
		end
	end

	if var_102_1 == 1 then
		var_0_6.__left1(var_102_3, var_102_4, arg_102_0, var_102_2)
	elseif var_102_1 == 2 then
		var_0_6.__left2(var_102_3, var_102_4, arg_102_0, var_102_2)
	end

	return table.concat(var_102_3)
end

function var_0_6.__left2(arg_103_0, arg_103_1, arg_103_2, arg_103_3)
	local var_103_0 = var_0_51.byte(arg_103_2, arg_103_3 + 1) * 1024 + var_0_51.byte(arg_103_2, arg_103_3 + 2) * 4
	local var_103_1 = math.floor(var_103_0 / 4096) % 64 + 1

	arg_103_0[arg_103_1] = var_0_6.__code[var_103_1]

	local var_103_2 = math.floor(var_103_0 / 64) % 64 + 1

	arg_103_0[arg_103_1 + 1] = var_0_6.__code[var_103_2]

	local var_103_3 = var_103_0 % 64 + 1

	arg_103_0[arg_103_1 + 2] = var_0_6.__code[var_103_3]
	arg_103_0[arg_103_1 + 3] = "="
end

function var_0_6.__left1(arg_104_0, arg_104_1, arg_104_2, arg_104_3)
	local var_104_0 = var_0_51.byte(arg_104_2, arg_104_3 + 1) * 16
	local var_104_1 = math.floor(var_104_0 / 64) % 64 + 1

	arg_104_0[arg_104_1] = var_0_6.__code[var_104_1]

	local var_104_2 = var_104_0 % 64 + 1

	arg_104_0[arg_104_1 + 1] = var_0_6.__code[var_104_2]
	arg_104_0[arg_104_1 + 2] = "="
	arg_104_0[arg_104_1 + 3] = "="
end

function var_0_6.decode(arg_105_0)
	local var_105_0 = var_0_51.len(arg_105_0)
	local var_105_1 = 0

	if var_0_51.sub(arg_105_0, var_105_0 - 1) == "==" then
		var_105_1 = 2
		var_105_0 = var_105_0 - 4
	elseif var_0_51.sub(arg_105_0, var_105_0) == "=" then
		var_105_1 = 1
		var_105_0 = var_105_0 - 4
	end

	local var_105_2 = {}
	local var_105_3 = 1
	local var_105_4 = var_0_6.__decode

	for iter_105_0 = 1, var_105_0, 4 do
		local var_105_5 = var_105_4[var_0_51.byte(arg_105_0, iter_105_0)]
		local var_105_6 = var_105_4[var_0_51.byte(arg_105_0, iter_105_0 + 1)]
		local var_105_7 = var_105_4[var_0_51.byte(arg_105_0, iter_105_0 + 2)]
		local var_105_8 = var_105_4[var_0_51.byte(arg_105_0, iter_105_0 + 3)]
		local var_105_9 = var_105_5 * 262144 + var_105_6 * 4096 + var_105_7 * 64 + var_105_8
		local var_105_10 = var_0_51.char(var_105_9 % 256)
		local var_105_11 = math.floor(var_105_9 / 256)
		local var_105_12 = var_0_51.char(var_105_11 % 256)
		local var_105_13 = math.floor(var_105_11 / 256)

		var_105_2[var_105_3] = var_0_51.char(var_105_13 % 256)
		var_105_2[var_105_3 + 1] = var_105_12
		var_105_2[var_105_3 + 2] = var_105_10
		var_105_3 = var_105_3 + 3
	end

	if var_105_1 == 1 then
		var_0_6.__decodeLeft1(var_105_2, var_105_3, arg_105_0, var_105_0)
	elseif var_105_1 == 2 then
		var_0_6.__decodeLeft2(var_105_2, var_105_3, arg_105_0, var_105_0)
	end

	return table.concat(var_105_2)
end

function var_0_6.__decodeLeft1(arg_106_0, arg_106_1, arg_106_2, arg_106_3)
	local var_106_0 = var_0_6.__decode
	local var_106_1 = var_106_0[var_0_51.byte(arg_106_2, arg_106_3 + 1)]
	local var_106_2 = var_106_0[var_0_51.byte(arg_106_2, arg_106_3 + 2)]
	local var_106_3 = var_106_0[var_0_51.byte(arg_106_2, arg_106_3 + 3)]
	local var_106_4 = var_106_1 * 4096 + var_106_2 * 64 + var_106_3
	local var_106_5 = math.floor(var_106_4 / 1024) % 256
	local var_106_6 = math.floor(var_106_4 / 4) % 256

	arg_106_0[arg_106_1] = var_0_51.char(var_106_5)
	arg_106_0[arg_106_1 + 1] = var_0_51.char(var_106_6)
end

function var_0_6.__decodeLeft2(arg_107_0, arg_107_1, arg_107_2, arg_107_3)
	local var_107_0 = var_0_6.__decode
	local var_107_1 = var_107_0[var_0_51.byte(arg_107_2, arg_107_3 + 1)]
	local var_107_2 = var_107_0[var_0_51.byte(arg_107_2, arg_107_3 + 2)]
	local var_107_3 = var_107_1 * 64 + var_107_2
	local var_107_4 = math.floor(var_107_3 / 16)

	arg_107_0[arg_107_1] = var_0_51.char(var_107_4)
end

return StartDebug
