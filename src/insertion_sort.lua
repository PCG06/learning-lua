-- Lua script to perform insertion sort (using while loop)

local nums = {4, 6, 3, 1, 8, 2, 9}
local n = #nums

print("Before sorting:")
for _, v in ipairs(nums) do
    io.write(v .. " ")
end
print("\n")

local i = 2
while i <= n do
    local j = i - 1
    local k = nums[i]

    while j >= 1 and nums[j] > k do
        nums[j + 1] = nums[j]
        j = j - 1
    end

    nums[j + 1] = k
    i = i + 1
end

print("After sorting:")
for _, v in ipairs(nums) do
    io.write(v .. " ")
end
print()
