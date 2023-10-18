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
--local tbl = {1, 5, 6, 15, 20, 25, 29, 30, 35, 45, 49, 50, 55}
local tbl = {1, 5, 6, 15, 20, 25, 25, 29, 30, 35, 45, 49, 50, 55}

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

local function slice2(tblx, index)
	local tbx = {}
	for i = 1, index-1 do
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
	if valx + val == x then
		return true, val
	end

	local sliceX2 = slice2(tblx, index)
	if #sliceX2 == 0 then return false, -1 end
	local mid2 = FindMiddle(sliceX2)
	local val2 = sliceX2[mid2]
	if not val2 then print(mid2, _dt(sliceX2)) end
	if valx + val2 == x then
		return true, val2
	end

	local r, p1 = doHalfCheck(sliceX, mid, valx)
	local l, p2 = doHalfCheck(sliceX2, mid2, valx)
	print(r, p1, l, p2)
	return r or l, r and p1 or p2
end

-- when move more left index = index -1 to include the old value

local index = FindMiddle(tbl)
local val_pairs = {}
local c = 0
for i = index, 1, -1 do
	if c > 0 then index = index + 1 end
	local leftV = tbl[i]
	--print("Trying "..tostring(leftV))
	local match, val = doHalfCheck(tbl, index, leftV)
	if match then
		val_pairs[#val_pairs + 1] = {leftV, val}
	end
	c = c + 1
end
print(_dt(val_pairs))
