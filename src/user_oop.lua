-- Lua script to do some basic OOP operations

local User = {}
User.__index = User

function User:new(name, age)
    local obj = {
        name = name,
        age = age
    }

    setmetatable(obj, User)
    return obj
end

function User:speak()
    print("My name is " .. self.name .. ".")
    print("I am " .. self.age .. " years old.")
end

local u = User:new("PCG", 19)
u:speak()
