-- Lua script to find factorial of a number

local function factorial(num)
    if num == 0 then return 1 end

    return num * factorial(num - 1)
end


io.write("Enter number to find factorial: ")
local num = tonumber(io.read())
local fact = factorial(num)
print(string.format("Factorial of %d: %d", num, fact))