function init_game()
end

function update_game()
    update_gamestate_btns()
	update_game_btns()
	-- TODO: add gamestate change here
end

function draw_game()
    cls(Color.LIGHT_GREY)
	Pegboard.draw()
	Pegboard.draw_scores()
	color(0)
	tableau_hand:draw(10,50)
	player_one.hand:draw(10,110)
	-- print("start_card.body: "..#start_card.body,2,2,0)
	start_card:draw(115,30)
end