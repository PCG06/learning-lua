-- Lua script to perform operations on a string

io.write("Enter a string: ")
local str = io.read()

print("Your string: " .. str)

local n = #str
print("Characters in string: " .. n)

local str_rev = str:reverse()
print("Reverse string: " .. str_rev)

local str_upr = str:upper()
print("String in uppercase: " .. str_upr)

local str_lwr = str:lower()
print("String in uppercase: " .. str_lwr)

local str_concat = str .. str_rev
print("String concate with reverse: " .. str_concat)

local num_count = 0
local char_count = 0
local spechr_count = 0
local space_count = 0

for i = 1, n do
    local ch = str:sub(i, i)

    -- Numbers
    if ch >= "0" and ch <= "9" then
        num_count = num_count + 1
    -- Alphabets
    elseif ch:upper() >= "A" and ch:upper() <= "Z" then
        char_count = char_count + 1
    -- Spaces
    elseif ch == " " then
        space_count = space_count + 1
    -- Special characters
    else
        spechr_count = spechr_count + 1
    end
end

print("Numbers in string: " .. num_count)
print("Alphabets in string: " .. char_count)
print("Special characters in string: " .. spechr_count)
print("Spaces in string: " .. space_count)
