-- Lua script to find Fibonacci series of til N

io.write("Enter limits for Fibonacci series: ")
local lwr, upr = io.read("*n", "*n")

if lwr >= upr then
    print("Range is too small")
    return
end

local f1, f2, f3 = 1, 0, 0

print("The series:")
while f1 <= upr do
    if f1 >= lwr then
        io.write(f1 .. " ")
    end
    f3 = f1 + f2
    f1 = f2
    f2 = f3
end
print()
