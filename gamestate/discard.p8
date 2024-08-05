function init_discard()
    transition_timer_started = false
    delay_start = 0
end

function update_discard()
    update_gamestate_btns()
    update_discard_btns()
    
    if ((#crib.body) >= 4) and not transition_timer_started then
        -- TODO: Animate pile moving off the right side of the screen
        delay_start = time()
        transition_timer_started = true
    end
    
    if transition_timer_started and (time() - delay_start == 1) then
        start_card:take_card(tableau_deck:give_card())
        transition_timer_started = false
        gamestate = "game"
    end
end

function draw_discard()
    cls(Color.LIGHT_GREY)
	color(0)
	crib:draw(10, 50)
	player_one.hand:draw(10,110)
end