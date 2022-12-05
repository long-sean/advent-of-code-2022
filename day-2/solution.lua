local file = 'input.txt'
local total = 0

local rock = {
    beats = "C",
    draws = "A",
    bonus = 1
}

local paper = {
    beats = "A",
    draws = "B",
    bonus = 2
}

local scissors = {
    beats = "B",
    draws = "C",
    bonus = 3
}

local hands = {
    X = rock,
    Y = paper,
    Z = scissors
}

local alternate = {
    X = "lose",
    Y = "draw",
    Z = "win"
}

local function split_round(inputstr)
    local match = string.gmatch(inputstr, "([^" .. "%s" .. "]+)")
    return {
        opponent = match(),
        me = match()
    }
end

for line in io.lines(file) do
    local round = split_round(line)
    if hands[round.me].beats == round.opponent then
        total = total + hands[round.me].bonus + 6
    elseif hands[round.me].draws == round.opponent then
        total = total + hands[round.me].bonus + 3
    else
        total = total + hands[round.me].bonus
    end
end

print(string.format("Part 1 result: %s", total))