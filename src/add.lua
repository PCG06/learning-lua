-- Lua script to add two numbers

io.write("Enter value of A: ")
local a = tonumber(io.read())

io.write("Enter value of B: ")
local b = tonumber(io.read())

local c = a + b
print(string.format("%d + %d = %s", a, b, c))
