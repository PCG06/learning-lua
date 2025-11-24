-- Lua script to perform arithmetic operations on 2 numbers using a table (and functions)

local ops = {
    ["+"] = function(a,b) return a + b end,
    ["-"] = function(a,b) return a - b end,
    ["*"] = function(a,b) return a * b end,
    ["/"] = function(a,b) return a / b end
}

io.write("Enter value of A: ")
local a = tonumber(io.read())

io.write("Enter value of B: ")
local b = tonumber(io.read())

io.write("Enter operator (+, -, *, /): ")
local op = io.read()

local fn = ops[op]

if fn then
    local result = fn(a,b)
    print(string.format("%d %s %d = %d", a, op, b, result))
else
    print("Invalid operation")
end
