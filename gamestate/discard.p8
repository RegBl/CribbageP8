function init_discard()
end

function update_discard()
    update_gamestate_btns()
    update_discard_btns()
    
    if ((#crib.body) >= 4) then
        -- TODO: Turn over start card (maybe belongs in game state)
        -- TODO: Delay for 1 second(?) before changing state
        -- TODO: Animate pile moving off the right side of the screen
        gamestate = "game"
    end
end

function draw_discard()
    cls(Color.LIGHT_GREY)
	color(0)
	crib:draw(10, 50)
	player_one.hand:draw(10,110)
    -- print("Crib size:"..#crib.body.." cards", 10, 10)
end