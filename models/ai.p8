AI = {
    difficulty = '',
}

-- TODO: difficulty as state machine:
-- TODO: * come up with top level ai functions e.g. easy { bid = easy_bid ...}

function AI:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end