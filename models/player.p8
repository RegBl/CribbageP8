Player = {
    name = '',
    score = 0,
    hand = {},
    color = Color.WHITE,
    is_ai = false
}

function Player.setup_players()
    player_one = Player:new({ name = "player_one", hand = player_one_hand, color = Color.RED })
    player_two = Player:new({ name = "player_two", hand = player_two_hand, color = Color.BLUE, is_ai = true })

    rnd(player_one.hand.body):toggle_selected()

    selected_index = player_one.hand:get_index_of_selected()
end

function Player:set_name(name)
    self.name = name
end

function Player:get_name()
    return self.name
end

function Player:get_score()
    return self.score
end

function Player:raise_score_by(amount)
    self.score = self.score + amount
    -- TODO: ask tableau_hand how many pegging points (can be zero) to add to self.score
end

function Player:give_card()
    if self.is_ai == true then
        return self.hand:ai_give_card()
    else
        return self.hand:give_card()
    end
end

function Player:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

-- TODO: add 'brain' to player object
-- TODO: figure out 'brain' parameters, e.g. player vs ai