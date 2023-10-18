local _t, _dt = type; --// DumpTable
_dt = function(table, nb)
	if nb == nil then nb = 0 end
	local ty = _t(table)
	if ty == 'table' then
		local s = ''
		for i = 1, nb + 1, 1 do s = s .. "    " end
		s = '{\n'
		for k,v in pairs(table) do
			if _t(k) ~= 'number' then k = '"'..k..'"' end
			for i = 1, nb, 1 do
				s = s .. "    "
			end
			s = s .. '['..k..'] = ' .. _dt(v, nb + 1) .. ',\n'
		end
		for i = 1, nb, 1 do s = s .. "    " end
		return s .. '}'
	end
	if ty == "string" then return '"'..tostring(table)..'"' end return tostring(table)
end

-- x = 50


-- Go to middle
	-- Check if middle-right is more than x
		--> middle-left get that middle


-- middle-left for each check every right

local x = 50
local tbl = {1, 5, 15, 20, 25, 29, 30, 35, 45, 50}

function FindMiddle(this, index)
	if not index then index = math.floor(#this/2) end
	if #this == 1 then return 1 end
	if this[index] > x then
		return FindMiddle(this, index)
	else
		return index
	end
end

local function slice(tblx, index)
	local tbx = {}
	for i = index+1, #tblx do
		tbx[#tbx + 1] = tblx[i]
	end
	--print(_dt(tbx))
	return tbx
end

local function doHalfCheck(tblx, index, valx)
	local sliceX = slice(tblx, index)
	if #sliceX == 0 then return false, -1 end
	local mid = FindMiddle(sliceX)
	local val = sliceX[mid]
	--print("Checking ", val, valx)
	if valx + val == x then
		--print("OMGSSSSSSSS", valx, val)
		return true, val
	else
		return doHalfCheck(sliceX, mid, valx)
	end
end


local index = FindMiddle(tbl)
local omgs = {}
for i = index, 1, -1 do
	local leftV = tbl[i]
	--print("Trying "..tostring(leftV))
	local match, val = doHalfCheck(tbl, index, leftV)
	if match then
		omgs[#omgs + 1] = {leftV, val}
	end
end
print(_dt(omgs))
