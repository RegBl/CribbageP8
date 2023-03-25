function init_discard()
end

function update_discard()
    update_gamestate_btns()
    update_discard_btns()
    
    if ((#crib.body) >= 4) then
        -- TODO: Delay for 1 second(?) before changing state
        -- TODO: Animate pile moving off the right side of the screen
        delay_time = time()
        if ((time() - delay_time) > 1) then
            start_card:take_card(tableau_deck:give_card())
            gamestate = "game"
        end
    end
end

function draw_discard()
    cls(Color.LIGHT_GREY)
	color(0)
	crib:draw(10, 50)
	player_one.hand:draw(10,110)
end