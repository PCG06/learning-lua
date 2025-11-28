-- Lua script to check whether a number is a prime number or not

local function prime_check(num)
    if num < 2 then return false end

    for i = 2, math.floor(sqrt(num)) do
        if num % i == 0 then
            return false
        end
    end

    return true
end

io.write("Enter a number: ")
local num = tonumber(io.read())

local is_prime = prime_check(num)

if is_prime then
    print("It is a prime number")
else
    print("It is not a prime number")
end
