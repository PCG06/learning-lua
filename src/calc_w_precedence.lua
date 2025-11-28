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

    local cur_num = 0
    local is_num = false

    local num_id = 1
    local op_id = 1

    -- Parse expression: extract numbers + operators
    for i = 1, #expr do
        local ch = expr:sub(i, i)

        if ch >= "0" and ch <= "9" then
            cur_num = cur_num * 10 + tonumber(ch)
            is_num = true

        elseif ch == "+" or ch == "-" or ch == "*" or ch == "/" then
            if is_num then
                nums[num_id] = cur_num
                num_id = num_id + 1
                cur_num = 0
                is_num = false
            end

            ops[op_id] = ch
            op_id = op_id + 1
        end
    end

    -- Push the last number
    if is_num then
        nums[num_id] = cur_num
        num_id = num_id + 1
    end

    -- Evaluate multiplication and divison first
    local i = 1
    while i <= op_id - 1 do
        local op = ops[i]

        if op == "*" or op == "/" then
            local fn = calc[op]
            nums[i + 1] = fn(nums[i], nums[i + 1])

            -- shift operators left
            for j = i, op_id - 2 do
                ops[j] = ops[j + 1]
            end

            -- shift numbers left
            for j = i, num_id - 2 do
                nums[j] = nums[j + 1]
            end

            op_id = op_id - 1
            num_id = num_id - 1
        else
            i = i + 1 -- only move when no collapse happened
        end
    end

    -- Evaluate addition and subtraction later
    local result = nums[1]
    for i = 1, op_id - 1 do
        local fn = calc[ops[i]]
        result = fn(result, nums[i + 1])
    end

    return result
end


io.write("Enter expression: ")
local expr = io.read()

local result = getresult(expr)
print("Result:", result)
