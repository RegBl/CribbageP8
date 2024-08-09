function init_game()
end

function update_game()
    update_gamestate_btns()
	update_game_btns()
	Pegboard.update_peg()
	-- TODO: add 31_count score
	-- TODO: * place in lower right of screen
	-- TODO: * where to display "go" message, center of screen overlay/modal?
	-- TODO: add pegging rules
end

function draw_game()
    cls(Color.LIGHT_GREY)
	Pegboard.draw()
	Pegboard.draw_scores()
	Pegboard.draw_peg()
	color(0)
	tableau_hand:draw(10,50)
	player_one.hand:draw(10,110)
	start_card:draw(115,30)
	-- print(player_two.hand:print_deck(),1,1,Color.BLACK)
end