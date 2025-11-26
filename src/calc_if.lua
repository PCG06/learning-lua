-- Lua script to perform arithmetic operations on 2 numbers using if-else ladder

io.write("Enter two numbers: ")
local a, b = io.read("*n", "*n")

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