-- Lua script to check whether a number is an armstrong number or not

-- This is so stupid, but it works nicely
local function digits(n)
    return #tostring(math.abs(n))
end

local function armstrong_check(num)
    if num < 0 then return false end

    local temp = num
    local sum = 0
    local digs = digits(num)

    while temp > 0 do
        local rem = temp % 10
        sum = sum + (rem ^ digs)
        temp = math.floor(temp / 10)
    end

    return num == sum
end

io.write("Enter a number: ")
local num = tonumber(io.read())

local is_armstrong = armstrong_check(num)

if is_armstrong then
    print("It is an armstrong number")
else
    print("It is not an armstrong number")
end
