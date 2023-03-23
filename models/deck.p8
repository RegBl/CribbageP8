Deck = {
    body = {},
    is_tableau_hand=false,
}

function Deck.get_standard_deck()
    local deck = {}
    for suit in all {'clubs', 'diamonds', 'hearts', 'spades'} do
        for rank=1,13 do
            card = Card:new({
                suit=suit, 
                rank=rank,
            })
            add(deck, card)
        end
    end
    return deck
end

function Deck.setup_decks()
    tableau_deck = Deck:new({body=Deck.get_standard_deck()})
	player_one_hand = Deck:new({body=tableau_deck:draw_x_cards(6)})
	player_two_hand = Deck:new({body=tableau_deck:draw_x_cards(6)})
	crib = Deck:new()
	tableau_hand = Deck:new({body=Card:new{tableau_deck:draw_card()},is_tableau_hand=true})
end

function Deck:draw(x,y)
    if self.is_tableau_hand and #self.body > 4 then
        Card.draw_facedown(x,y)
        x = x + 8
        for i=#self.body-3,#self.body do
            self.body[i]:draw(x,y)
            x = x + 14
        end
    else
        for i=1,#self.body do
            self.body[i]:draw(x,y)
            x = x + 14
        end
    end
end

function Deck:draw_x_cards(x)
	local hand = {}
	for i=1,x do
		add(hand,self:draw_card())
	end
	return hand
end

function Deck:draw_card()
	local card = rnd(self.body)
	del(self.body,card)
	return card
end

function Deck:draw_selected_card()
    local index = self:get_index_of_selected()
    if index then
        local card = self.body[index]
        del(self.body, card)
        card.is_selected = false
        return card
    end
    return false
end

function Deck:get_index_of_selected()
    for index, card in ipairs(self.body) do
        if card.is_selected then
            return index
        end
    end
    return false
end

function Deck:pickup_card(card)
    add(self.body, card)
end

function Deck:select_previous()
    if (#self.body == 0) return
    local index = self:get_index_of_selected()
    if index then
        self.body[index].is_selected = false
        if index > 1 then
            self.body[index-1].is_selected = true
        else
            self.body[#self.body].is_selected = true
        end
    else
        self.body[1].is_selected = true
    end
end

function Deck:select_next()
    if (#self.body == 0) return
    local index = self:get_index_of_selected()
    if index then
        self.body[index].is_selected = false
        if index < #self.body then
            self.body[index+1].is_selected = true
        else
            self.body[1].is_selected = true
        end
    else
        self.body[#self.body].is_selected = true
    end
end

function Deck:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end