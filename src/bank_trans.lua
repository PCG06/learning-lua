-- Lua script to perform bank transactions using OOP

local Bank = {}
Bank.__index = Bank

Bank.MIN_BALANCE = 500

function Bank:new(id, name, acc_type, initial_bal)
    local obj = {
        id = id,
        name = name,
        acc_type = acc_type,
        balance = initial_bal
    }

    return setmetatable(obj, Bank)
end


function Bank:show_balance()
    print("Balance: " .. self.balance)
end

function Bank:show_details()
    print("\n---DETAILS---")
    print("ID: " .. self.id)
    print("Name: " .. self.name)
    print("Account type: " .. self.acc_type)
    self:show_balance()
end

function Bank:deposit(dep)
    self.balance = self.balance + dep
    print("Deposited: " .. dep)
    self:show_balance()
end

function Bank:withdraw(with)
    if (self.balance - with) >= Bank.MIN_BALANCE then
        self.balance = self.balance - with
        print("Withdrawn: " .. with)
        self:show_balance()
    else
        print("Maintain minimum balance!")
        self:show_balance()
        print("Maximum withdrawl possible: " .. (self.balance - Bank.MIN_BALANCE))
    end
end

local b = nil

while true do
    if not b then
        print("---BANK---")
        print("Sign up as new customer!")
        io.write("Enter ID: ")
        local id = tonumber(io.read())
        io.write("Enter Name: ")
        local name = io.read()
        io.write("Enter account type (SB, RD, FD): ")
        local acc_type = io.read():upper()

        local initial_bal = 0

        while initial_bal < Bank.MIN_BALANCE do
            io.write(string.format("Enter initial balance (minimum %d): ", Bank.MIN_BALANCE))
            initial_bal = tonumber(io.read())
            if initial_bal < Bank.MIN_BALANCE then
                print("Initial balance must be at least " .. Bank.MIN_BALANCE)
            else
                break
            end
        end
    
        b = Bank:new(id, name, acc_type, initial_bal)
        b:show_details()
    else
        print("\n---BANK---")
        print("1. Account details")
        print("2. Deposit")
        print("3. Withdraw")
        print("0. Exit")
        io.write("Enter your choice: ")
        local ch = tonumber(io.read())
        if ch == 1 then
            b:show_details()
        elseif ch == 2 then
            io.write("\nEnter amount to be deposited: ")
            local dep = tonumber(io.read())

            if dep <= 0 then
                print("Invalid amount!")
            else
                b:deposit(dep)
            end

        elseif ch == 3 then
            io.write("\nEnter amount to be withdrawn: ")
            local with = tonumber(io.read())

            if with <= 0 then
                print("Invalid amount!")
            else
                b:withdraw(with)
            end

        elseif ch == 0 then
            print("\nExiting bank...")
            return
        else
            print("\nInvalid choice! Please enter again!")
        end
    end
end
