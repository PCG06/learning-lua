-- Lua script to perform arithmetic operations on 2 numbers using if-else ladder

io.write("Enter value of A: ")
local a = tonumber(io.read())

io.write("Enter value of B: ")
local b = tonumber(io.read())

io.write("Enter operator (+, -, *, /): ")
local op = io.read()

if op == "+" then
    print(string.format("%d + %d = %d", a, b, a + b))
elseif op == "-" then
    print(string.format("%d - %d = %d", a, b, a - b))
elseif op == "*" then
    print(string.format("%d * %d = %d", a, b, a * b))
elseif op == "/" then
    print(string.format("%d / %d = %d", a, b, a / b))
else
    print("Invalid operator")
end