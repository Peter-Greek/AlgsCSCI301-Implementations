function split(L, p, s)
    local tmp = {}
    for i = 1, #L do
        local a = L[i]
        if (s == 1 and a > p) or  ((s == nil or s == 0) and a < p) then
            tmp[#tmp+1] = a
        elseif s == 2 and a == p then
            tmp[#tmp+1] = a
        end
    end
    return tmp
end

function QuickSelect(L,k)
    local p = L[1]
    local L1 = split(L, p, 0)
    local L2 = split(L, p, 2)
    local L3 = split(L, p, 1)
    if (#L1 >= k) then
        return QuickSelect(L1,k)
    elseif (#L1+#L2 >= k) then
        return p
    else
        return QuickSelect(L3,k-#L1-#L2)
    end
end

print(QuickSelect({18, 84, 38, 10, 22, 21, 98, 21, 98, 54, 33}, 6))