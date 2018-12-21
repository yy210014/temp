local std_pairs = pairs
local next = next
local type = type
local getmetatable = getmetatable
local debug = debug
local log = log

function pairs(t)
	local mt = getmetatable(t)

	if not mt then
		local first = next(t)
		--Game.Log(tostring(first.gchash))
		if first then
			Game.Log("危险的遍历1")
		end
		if type(first) == "table" then
			Game.Log("危险的遍历2")
		end
		if first.gchash ~= nil then
			Game.Log("危险的遍历3")
		end
		if first and type(first) == "table" and not first.gchash then
			Game.LogError("危险的遍历")
		end
	end                                                                                                                                                            
	return std_pairs(t)
end
