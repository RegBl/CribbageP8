Card = {
    suit = "",
    rank = 0,
    is_selected = false,
}

function Card.draw_facedown(x,y)
    fillp(0b0100101000011010)
    rectfill(x-3,y-3,x+30,y+40,Color.RED)
    fillp()
    rect(x-3,y-3,x+30,y+40,0)
end

function Card:draw(x,y)
    if self.is_selected then bgcolor = Color.DARK_GREY else bgcolor = Color.WHITE end
    suit_color=nil
    suit_spr=nil
    rank_is_sprite=false
    rank_spr=nil

    --Draw card outline
    rectfill(x-3,y-3,x+30,y+40,bgcolor)
    rect(x-3,y-3,x+30,y+40,0)

    --Determine color, rank, suit_spr, and rank_spr
    if self.suit == "hearts" or self.suit == "diamonds" then
        suit_color=Color.RED
    else
        suit_color=Color.BLACK
    end

    if self.rank == 1 or
        self.rank == 11 or
        self.rank == 12 or
        self.rank == 13 then
        rank_is_sprite=true
    else
        rank_is_sprite=false
    end

    if (self.suit == "hearts") suit_spr=1
    if (self.suit == "diamonds") suit_spr=2
    if (self.suit == "clubs") suit_spr=3
    if (self.suit == "spades") suit_spr=4

    if (self.rank == 1) rank_spr=5
    if (self.rank == 13) rank_spr=6
    if (self.rank == 12) rank_spr=7
    if (self.rank == 11) rank_spr=8
    if (self.rank == 10) rank_spr=9
    if (self.rank == 9) rank_spr=10
    if (self.rank == 8) rank_spr=11
    if (self.rank == 7) rank_spr=12
    if (self.rank == 6) rank_spr=13
    if (self.rank == 5) rank_spr=14
    if (self.rank == 4) rank_spr=15
    if (self.rank == 3) rank_spr=16
    if (self.rank == 2) rank_spr=17

    --Set drawing colors
    if suit_color then
        pal(Color.DARK_GREY,suit_color)
        color(suit_color)
    end

    --Draw rank
    spr(rank_spr,x,y)

    --Draw suit
    spr(suit_spr,x,y+9)

    pal()
end

function Card:toggle_selected()
    self.is_selected = not self.is_selected
end

function Card:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

--0100
--1010
--0001
--1010