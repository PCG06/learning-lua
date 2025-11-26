-- Lua script to perform linear search (using for loop)

local nums = {4, 6, 3, 1, 8, 2, 9}
local n = #nums

print("Table:")
for _, v in ipairs(nums) do
    io.write(v .. " ")
end
print("\n")

io.write("Enter element to search: ")
local ele = tonumber(io.read())

local pos = nil

for i = 1, n, 1 do
    if ele == nums[i] then
        pos = i
        break
    end
end

if pos then
    print(string.format("Element %d found at position %d", ele, pos))
else
    print(string.format("Element %d does not exist in the table", ele))
end
