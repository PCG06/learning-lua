-- Lua script to perform binary search (using while loop)

local nums = {1, 2, 3, 4, 6, 8, 9}
local n = #nums

print("Table:")
for _, v in ipairs(nums) do
    io.write(v .. " ")
end
print("\n")

io.write("Enter element to search: ")
local ele = tonumber(io.read())

local min = 1
local max = n
local pos = nil

while min <= max do
    local mid = math.floor((min + max) / 2)   -- make mid an integer

    if ele == nums[mid] then
        pos = mid
        break
    elseif ele < nums[mid] then
        max = mid - 1
    else
        min = mid + 1
    end
end

if pos then
    print(string.format("Element %d found at position %d", ele, pos))
else
    print(string.format("Element %d does not exist in the table", ele))
end
