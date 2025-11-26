-- Lua script to perform bubble sort (using for loop)

local nums = {4, 6, 3, 1, 8, 2, 9}
local n = #nums

print("Before sorting:")
for _, v in ipairs(nums) do
    io.write(v .. " ")
end
print("\n")

for i = 1, n - 1, 1 do
    for j = 1, n - i - 1, 1 do
        if nums[j] > nums[j + 1] then
            local t = nums[j]
            nums[j] = nums[j + 1]
            nums[j + 1] = t
        end
    end
end

print("After sorting:")
for _, v in ipairs(nums) do
    io.write(v .. " ")
end
print()
