-- Lua script to perform arithmetic operations on 2 numbers using a function

local function calc_nums(a, b, op)
    local final
    if op == "+" then
        final = a + b
    elseif op == "-" then
        final = a - b
    elseif op == "*" then
        final = a * b
    elseif op == "/" then
        final = a / b
    else
        final = nil
    end

    return final
end


io.write("Enter two numbers: ")
local a, b = io.read("*n", "*n")

io.write("Enter operator (+, -, *, /): ")
local op = io.read()

local val = calc_nums(a, b, op)

if val then
    print(string.format("%d %s %d = %d", a, op, b, val))
else
    print("Invalid operator")
end
