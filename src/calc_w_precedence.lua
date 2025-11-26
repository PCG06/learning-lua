-- Lua script to perform arithmetic operations on an expression with precedence
-- Does not work with parenthesis, decimal points, negative numbers, power of, or anything like that
-- Just basic addition, subtraction, multiplication and division.

local calc = {
    ["+"] = function(a,b) return a + b end,
    ["-"] = function(a,b) return a - b end,
    ["*"] = function(a,b) return a * b end,
    ["/"] = function(a,b) return a / b end
}

local function getresult(expr)
    local nums = {}
    local ops = {}

    local currNum = 0
    local isNum = false

    local numId = 1
    local opId = 1

    -- Parse expression: extract numbers + operators
    for i = 1, #expr do
        local ch = expr:sub(i, i)

        if ch >= "0" and ch <= "9" then
            currNum = currNum * 10 + tonumber(ch)
            isNum = true

        elseif ch == "+" or ch == "-" or ch == "*" or ch == "/" then
            if isNum then
                nums[numId] = currNum
                numId = numId + 1
                currNum = 0
                isNum = false
            end

            ops[opId] = ch
            opId = opId + 1
        end
    end

    -- Push the last number
    if isNum then
        nums[numId] = currNum
        numId = numId + 1
    end

    -- Evaluate multiplication and divison first
    local i = 1
    while i <= opId - 1 do
        local op = ops[i]

        if op == "*" or op == "/" then
            local fn = calc[op]
            nums[i + 1] = fn(nums[i], nums[i + 1])

            -- shift operators left
            for j = i, opId - 2 do
                ops[j] = ops[j + 1]
            end

            -- shift numbers left
            for j = i, numId - 2 do
                nums[j] = nums[j + 1]
            end

            opId = opId - 1
            numId = numId - 1
        else
            i = i + 1 -- only move when no collapse happened
        end
    end

    -- Evaluate addition and subtraction later
    local result = nums[1]
    for i = 1, opId - 1 do
        local fn = calc[ops[i]]
        result = fn(result, nums[i + 1])
    end

    return result
end


io.write("Enter expression: ")
local expr = io.read()

local result = getresult(expr)
print("Result:", result)
